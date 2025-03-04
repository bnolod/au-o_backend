package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.auth.GenericOwnershipCheckerService;
import com.auo.backend.dto.create.CreateGroupDto;
import com.auo.backend.dto.create.CreatePostDto;
import com.auo.backend.enums.GroupRole;
import com.auo.backend.enums.PostType;
import com.auo.backend.models.*;
import com.auo.backend.repositories.GroupMemberRepository;
import com.auo.backend.repositories.GroupRepository;
import com.auo.backend.repositories.PostRepository;
import com.auo.backend.responses.GroupMemberResponse;
import com.auo.backend.responses.GroupResponse;
import com.auo.backend.responses.PostResponse;
import com.auo.backend.utils.UserUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class GroupService {

    private final GroupRepository groupRepository;
    private final AuthenticationService authenticationService;
    private final GroupMemberRepository groupMemberRepository;
    private final GenericOwnershipCheckerService<User, Group> groupOwnershipCheckerService;
    private final UserService userService;
    private final PostRepository postRepository;
    private final VehicleService vehicleService;

    public List<Group> getAllGroups() {
        return groupRepository.findAll();
    }

    private Group getGroupByGroupIdOrThrow(Long groupId) {
        Optional<Group> group = groupRepository.findById(groupId);
        if (group.isPresent()) return group.get();
        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "group_not_found");
    }

    public GroupMember getGroupMemberByUserAndGroup(User user,Group group) {
        Optional<GroupMember> optionalGroupMember= groupMemberRepository.getByUserAndGroup(user,group);
        if (optionalGroupMember.isEmpty()) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "not_found");
        return optionalGroupMember.get();
    }

    public boolean hasRequiredRoleInGroup(User user, Group group, List<GroupRole> requiredGroupRoles) {
        return group.getGroupMembers().stream().anyMatch(groupMember -> groupMember.getUser() == user
                && requiredGroupRoles.contains(groupMember.getGroupRole()));
    }

    public boolean isUserInGroup(User user, Group group) {
        return user.getGroups().stream().anyMatch(groupMember -> groupMember.getGroup() == group);
    }

    public GroupResponse createGroup( CreateGroupDto createGroupDto) {
        User user = UserUtils.getCurrentUser();
        StringBuilder groupAlias = new StringBuilder();
        for (Character c : createGroupDto.getName().toCharArray()) {
            if (Character.isUpperCase(c) && groupAlias.length() < 10) {
                groupAlias.append(c);
            }
        }
        if (groupAlias.isEmpty()) {
            groupAlias.append(createGroupDto.getName(), 0, 6);
        }

        Group group = Group.builder()
                .groupName(createGroupDto.getName())
                .groupAlias(createGroupDto.getAlias().trim().equals("") ? String.valueOf(groupAlias) : createGroupDto.getAlias())
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

    public GroupMemberResponse joinGroup( Long groupId) {
        User user = UserUtils.getCurrentUser();

        Optional<Group> optionalGroup = groupRepository.findById(groupId);

        if (optionalGroup.isEmpty()) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "group_not_found");

        Group group = optionalGroup.get();
        if (group.getGroupMembers().stream().anyMatch(groupMember -> groupMember.getUser().equals(user))) {
            throw new ResponseStatusException(HttpStatus.CONFLICT,"already_in_group");
        }

        GroupMember groupMember = new GroupMember(user,group);
        groupMember.setValid(group.isPublic());
        groupMember.setGroup(group);
        groupMemberRepository.save(groupMember);

        return new GroupMemberResponse(groupMember);
    }

    @Transactional
    public boolean handleJoinRequest( Long targetUserId, Long groupId, boolean isAccepted) {
        User user = UserUtils.getCurrentUser();

        Group group = getGroupByGroupIdOrThrow(groupId);
        List<GroupRole> rolesList = new ArrayList<GroupRole>();
        rolesList.add(GroupRole.ADMIN);
        rolesList.add(GroupRole.MODERATOR);

        if (!hasRequiredRoleInGroup(user, group,rolesList)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"unauthorized");
        }

        GroupMember targetMember = getGroupMemberByUserAndGroup(userService.findUserByIdOrThrow(targetUserId),group);

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
        User user = UserUtils.getCurrentUser();

        Group group = getGroupByGroupIdOrThrow(groupId);
        Optional<GroupMember> groupMember = groupMemberRepository.getByUserAndGroup(user,group);

        if (groupMember.isEmpty()) throw new ResponseStatusException(HttpStatus.CONFLICT, "not_in_group");

        if (group.getGroupMembers().stream().anyMatch(member -> member.getGroupRole().equals(GroupRole.ADMIN) && member.getUser() != user)) {
            groupMemberRepository.delete(groupMember.get());
        }
        throw new ResponseStatusException(HttpStatus.CONFLICT, "cannot leave group if you are the only admin");
    }

    public void deleteGroup(Long groupId) {
        GroupMember groupMember = getGroupMemberByUserAndGroup(
                UserUtils.getCurrentUser(),
                getGroupByGroupIdOrThrow(groupId));
        if (groupMember.getGroupRole().equals(GroupRole.ADMIN)) {
            groupRepository.delete(groupMember.getGroup());
        } else throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"unauthorized");
    }

    public GroupMemberResponse setRoleOfMember(Long groupId, Long targetUserId, GroupRole groupRole) {
        Group group = getGroupByGroupIdOrThrow(groupId);
        GroupMember user = getGroupMemberByUserAndGroup(UserUtils.getCurrentUser(),group);
        GroupMember targetUser = getGroupMemberByUserAndGroup(userService.findUserByIdOrThrow(targetUserId),group);
        if (user.equals(targetUser)) throw new ResponseStatusException(HttpStatus.CONFLICT, "cannot_set_own_role");
        if (user.getGroupRole() != GroupRole.ADMIN) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "admin_role_required");
        }
        if (targetUser.getGroupRole() == groupRole) throw new ResponseStatusException(HttpStatus.CONFLICT,"already_has_role");
        targetUser.setGroupRole(groupRole);
        groupMemberRepository.save(targetUser);

        return new GroupMemberResponse(targetUser);
    }

    public PostResponse addPostToGroup(Long groupId, CreatePostDto createPostDto) {
        GroupMember groupMember = getGroupMemberByUserAndGroup(
                UserUtils.getCurrentUser(),
                getGroupByGroupIdOrThrow(groupId));
        if (!groupMember.isValid()) throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"unauthorized");
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

        return new PostResponse(tempPost,groupMember.getUser());
    }

    public GroupResponse getGroupById(Long groupId) {
        User user = UserUtils.getCurrentUser();
        Group group = getGroupByGroupIdOrThrow(groupId);
        return new GroupResponse(group,user);
    }
    @Transactional
    public List<GroupResponse> getGroupsOfUser() {
        User user = UserUtils.getCurrentUser();
        List<GroupMember> groups = user.getGroups();
        return groups.stream().map(groupMember -> new GroupResponse(groupMember.getGroup(),user)).toList();
    }

    public List<PostResponse> getPostsByGroupId(Long groupId) {
        User user = UserUtils.getCurrentUser();
        Group group = getGroupByGroupIdOrThrow(groupId);
        if (!isUserInGroup(user,group)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "not in group");
        }
        return postRepository.findPostsByGroupMember_Group(group).stream().map(post -> new PostResponse(post,user)).toList();

    }


}
