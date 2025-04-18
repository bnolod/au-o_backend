package com.auo.backend.services;

import com.auo.backend.auth.GenericOwnershipCheckerService;
import com.auo.backend.dto.create.CreateGroupDto;
import com.auo.backend.dto.create.CreatePostDto;
import com.auo.backend.enums.GroupRole;
import com.auo.backend.enums.PostType;
import com.auo.backend.models.*;
import com.auo.backend.repositories.GroupMemberRepository;
import com.auo.backend.repositories.GroupMessageRepository;
import com.auo.backend.repositories.GroupRepository;
import com.auo.backend.repositories.PostRepository;
import com.auo.backend.responses.*;
import com.auo.backend.utils.UserUtils;
import com.auo.backend.websocketentity.IncomingMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class GroupService {

    private final GroupRepository groupRepository;
    private final GroupMemberRepository groupMemberRepository;
    private final UserService userService;
    private final PostRepository postRepository;
    private final VehicleService vehicleService;
    private final UserUtils userUtils;
    private final GroupMessageRepository groupMessageRepository;

    public List<Group> getAllGroups() {
        return groupRepository.findAll();
    }

    public Group getGroupByGroupIdOrThrow(Long groupId) {
        Optional<Group> group = groupRepository.findById(groupId);
        if (group.isPresent()) return group.get();
        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "group_not_found");
    }

    public GroupMember getGroupMemberByUserAndGroup(User user, Group group) {
        Optional<GroupMember> optionalGroupMember = groupMemberRepository.getByUserAndGroup(user, group);
        if (optionalGroupMember.isEmpty()) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "not_found");
        return optionalGroupMember.get();
    }

    public GroupMemberListResponse getGroupMembersByGroupId(User user, Long groupId) {
        Group group = getGroupByGroupIdOrThrow(groupId);

        Optional<GroupMember> groupMember = groupMemberRepository.getByUserAndGroup(user, group);

        if (groupMember.isEmpty()) throw new ResponseStatusException(HttpStatus.CONFLICT, "not_in_group");

        List<GroupUserResponse> groupUserResponses = group.getGroupMembers().stream().map(member -> new GroupUserResponse(new GroupMemberResponse(member))).toList();
        return new GroupMemberListResponse(group, user, groupUserResponses);
    }

    public boolean hasRequiredRoleInGroup(User user, Group group, List<GroupRole> requiredGroupRoles) {
        return group.getGroupMembers().stream().anyMatch(groupMember -> groupMember.getUser() == user
                && requiredGroupRoles.contains(groupMember.getGroupRole()));
    }

    public boolean isUserInGroup(User user, Group group) {
        return group.getGroupMembers().stream().anyMatch(groupMember -> Objects.equals(groupMember.getUser().getId(), user.getId()));
    }

    public GroupResponse createGroup(CreateGroupDto createGroupDto) {
        User user = userUtils.getCurrentUser();
        StringBuilder groupAlias = new StringBuilder();
        if (createGroupDto.getAlias() == null) {

        for (Character c : createGroupDto.getName().toCharArray()) {
            if (Character.isUpperCase(c) && groupAlias.length() < 10) {
                groupAlias.append(c);
            }
        }
        } else {
            groupAlias.append(createGroupDto.getAlias());
        }
        if (groupAlias.isEmpty()) {
            groupAlias.append(createGroupDto.getName(), 0, 6);
        }

        Group group = Group.builder()
                .groupName(createGroupDto.getName())
                .groupAlias(String.valueOf(groupAlias))
                .groupDescription(createGroupDto.getDescription())
                .bannerImageURL(createGroupDto.getBannerImage())
                .groupMembers(new ArrayList<>())
                .groupDescription(createGroupDto.getDescription())
                .isPublic(createGroupDto.isPublic())
                .build();
        groupRepository.save(group);

        GroupMember owner = new GroupMember(user, group);
        owner.setGroupRole(GroupRole.ADMIN);
        owner.setValid(true);

        groupMemberRepository.save(owner);

        return new GroupResponse(group, user);
    }

    public GroupMemberResponse joinGroup(Long groupId) {
        User user = userUtils.getCurrentUser();

        Optional<Group> optionalGroup = groupRepository.findById(groupId);

        if (optionalGroup.isEmpty()) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "group_not_found");

        Group group = optionalGroup.get();
        if (group.getGroupMembers().stream().anyMatch(groupMember -> groupMember.getUser().equals(user))) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "already_in_group");
        }

        GroupMember groupMember = new GroupMember(user, group);
        groupMember.setValid(group.isPublic());
        groupMember.setGroup(group);
        groupMemberRepository.save(groupMember);

        return new GroupMemberResponse(groupMember);
    }

    @Transactional
    public boolean handleJoinRequest(Long targetUserId, Long groupId, boolean isAccepted) {
        User user = userUtils.getCurrentUser();

        Group group = getGroupByGroupIdOrThrow(groupId);
        List<GroupRole> rolesList = new ArrayList<GroupRole>();
        rolesList.add(GroupRole.ADMIN);
        rolesList.add(GroupRole.MODERATOR);

        if (!hasRequiredRoleInGroup(user, group, rolesList)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");
        }

        GroupMember targetMember = getGroupMemberByUserAndGroup(userService.findUserByIdOrThrow(targetUserId), group);

        if (targetMember.isValid()) throw new ResponseStatusException(HttpStatus.CONFLICT, "already_in_group");
        if (isAccepted) {
            targetMember.setValid(true);
            groupMemberRepository.save(targetMember);
        } else {
            group.getGroupMembers().remove(targetMember);
            groupRepository.save(group);
        }
        return isAccepted;
    }

    public void leaveGroup(Long groupId) {
        User user = userUtils.getCurrentUser();

        Group group = getGroupByGroupIdOrThrow(groupId);
        GroupMember groupMember = groupMemberRepository.getByUserAndGroup(user, group).
                orElseThrow(()-> new ResponseStatusException(HttpStatus.BAD_REQUEST, "not in group"));

        if (group.getGroupMembers().stream().anyMatch(member -> member.getGroupRole().equals(GroupRole.ADMIN) && member.getUser() != user)) {
            groupMemberRepository.delete(groupMember);
            return;
        }
        if (!groupMember.getGroupRole().equals(GroupRole.ADMIN) ) {
            groupMemberRepository.delete(groupMember);
            return;
        }

        if (group.getGroupMembers().size() == 1) {
            groupMemberRepository.delete(groupMember);
            groupMemberRepository.flush();
            groupRepository.delete(group);
        }

        throw new ResponseStatusException(HttpStatus.CONFLICT, "cannot leave group if you are the only admin");
    }

    public void deleteGroup(Long groupId) {
        GroupMember groupMember = getGroupMemberByUserAndGroup(
                userUtils.getCurrentUser(),
                getGroupByGroupIdOrThrow(groupId));
        if (groupMember.getGroupRole().equals(GroupRole.ADMIN)) {
            groupRepository.delete(groupMember.getGroup());
        } else throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");
    }

    public GroupMemberResponse setRoleOfMember(Long groupId, Long targetUserId, GroupRole groupRole) {
        Group group = getGroupByGroupIdOrThrow(groupId);
        GroupMember user = getGroupMemberByUserAndGroup(userUtils.getCurrentUser(), group);
        GroupMember targetUser = getGroupMemberByUserAndGroup(userService.findUserByIdOrThrow(targetUserId), group);
        if (user.equals(targetUser)) throw new ResponseStatusException(HttpStatus.CONFLICT, "cannot_set_own_role");
        if (user.getGroupRole() != GroupRole.ADMIN) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "admin_role_required");
        }
        if (targetUser.getGroupRole() == groupRole)
            throw new ResponseStatusException(HttpStatus.CONFLICT, "already_has_role");
        targetUser.setGroupRole(groupRole);
        groupMemberRepository.save(targetUser);

        return new GroupMemberResponse(targetUser);
    }

    public GroupResponse updateGroup(Long groupId, CreateGroupDto createGroupDto) {
        Group group = getGroupByGroupIdOrThrow(groupId);
        GroupMember groupMember = getGroupMemberByUserAndGroup(
                userUtils.getCurrentUser(),
                group);
        if (groupMember.getGroupRole() != GroupRole.ADMIN) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "admin_role_required");
        }
        group.setGroupName(createGroupDto.getName());
        group.setGroupDescription(createGroupDto.getDescription());
        group.setGroupAlias(createGroupDto.getAlias());
        //group.setBannerImageURL(createGroupDto.getBannerImage());
        group.setPublic(createGroupDto.isPublic());
        groupRepository.save(group);
        return new GroupResponse(group, userUtils.getCurrentUser());
    }

    public PostResponse addPostToGroup(Long groupId, CreatePostDto createPostDto) {
        GroupMember groupMember = getGroupMemberByUserAndGroup(
                userUtils.getCurrentUser(),
                getGroupByGroupIdOrThrow(groupId));
        if (!groupMember.isValid()) throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");
        Vehicle vehicle = null;
        if (createPostDto.getVehicleId() != null) {
            vehicle = vehicleService.findOwnVehicleAndCheckOwnership(groupMember.getUser(), createPostDto.getVehicleId());
        }

        List<Image> imageList =
                createPostDto.getPostImages().stream().map(postImage -> Image
                        .builder()
                        .index(createPostDto.getPostImages().indexOf(postImage))
                        .url(postImage.getUrl())
                        .deleteHash(postImage.getDeleteHash())
                        .build()).toList();

        Post tempPost = Post.builder()
                .postType(PostType.GROUPPOST)
                .text(createPostDto.getText())
                .groupMember(groupMember)
                .images(imageList)
                .vehicle(vehicle)
                .location(createPostDto.getLocation())
                .build();
        postRepository.save(tempPost);

        return new PostResponse(tempPost, groupMember.getUser());
    }

    public GroupResponse getGroupById(Long groupId) {
        User user = userUtils.getCurrentUser();
        Group group = getGroupByGroupIdOrThrow(groupId);
        return new GroupResponse(group, user);
    }

    public GroupMemberResponse getOwnGroupMemberStatus(Long groupId) {
        User user = userUtils.getCurrentUser();
        Group group = getGroupByGroupIdOrThrow(groupId);
        GroupMember groupMember = getGroupMemberByUserAndGroup(user, group);
        return new GroupMemberResponse(groupMember);
    }

    public List<PostResponse> getPostsByGroupId(Long groupId) {
        User user = userUtils.getCurrentUser();
        Group group = getGroupByGroupIdOrThrow(groupId);
        if (!isUserInGroup(user, group)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "not in group");
        }
        return postRepository.findPostsByGroupMember_Group(group).stream().map(post -> new PostResponse(post, user)).toList();

    }

    public List<GroupResponse> getOwnGroups() {
        User user = userUtils.getCurrentUser();
        List<Group> groups =  groupRepository.getGroupsByGroupMembers_User(user);
        return groups.stream().map(group -> new GroupResponse(group,user)).toList();
    }


    public List<GroupResponse> getAllGroupsOfUser(Long userId) {
        User target = userService.findUserByIdOrThrow(userId);
        User user = userUtils.getCurrentUser();
        List<Group> groups = groupRepository.getGroupsByGroupMembers_User(target);
        groups.forEach(System.out::println);
        return groups.stream().map(group -> new GroupResponse(group,user)).toList();

    }

    public GroupMessage sendMessageToGroup(IncomingMessage incomingMessage, User user) {
        Group group = getGroupByGroupIdOrThrow(incomingMessage.getGroupId());
        GroupMessage groupMessage = GroupMessage.builder()
                .message(incomingMessage.getMessage())
                .user(user)
                .group(group)
                .build();
        groupMessage = groupMessageRepository.save(groupMessage);
        return groupMessage;
    }

    public List<GroupMessageResponse> getMessagesOfGroup(Long groupId) {
        User user = userUtils.getCurrentUser();
        Group group = getGroupByGroupIdOrThrow(groupId);

        if (!isUserInGroup(user,group)) throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"not in group");

        var groupMessages = groupMessageRepository.getGroupMessagesByGroupOrderByTimeDesc(group);
        return groupMessages.stream().map(GroupMessageResponse::ofMessage).toList();
    }

    public List<GroupMemberResponse> getPendingMembers(Long groupId) {
        Group group = getGroupByGroupIdOrThrow(groupId);
        User user = userUtils.getCurrentUser();
        List<GroupRole> rolesList = new ArrayList<>();
        rolesList.add(GroupRole.ADMIN);
        rolesList.add(GroupRole.MODERATOR);
        



        if (hasRequiredRoleInGroup(user, group, rolesList)) {
            return groupMemberRepository.findInvalidGroupMembers(group)
                    .stream().map(GroupMemberResponse::new).toList();
        } else {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");
        }
    }

    //TODO: Implement ezt meg azt
}
