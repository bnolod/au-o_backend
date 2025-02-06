package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.auth.GenericOwnershipCheckerService;
import com.auo.backend.dto.CreateGroupDto;
import com.auo.backend.dto.CreatePostDto;
import com.auo.backend.enums.GroupRole;
import com.auo.backend.enums.PostType;
import com.auo.backend.models.*;
import com.auo.backend.repositories.GroupMemberRepository;
import com.auo.backend.repositories.GroupRepository;
import com.auo.backend.repositories.PostRepository;
import com.auo.backend.responses.GroupMemberResponse;
import com.auo.backend.responses.GroupResponse;
import com.auo.backend.responses.PostResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
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

    public GroupResponse createGroup(String token, CreateGroupDto createGroupDto) {
        User user = authenticationService.getUserFromToken(token);
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
                .groupAlias(String.valueOf(groupAlias))
                .groupDescription(createGroupDto.getDescription())
                .bannerImageURL(createGroupDto.getBannerImage())
                .groupMembers(new ArrayList<>())
                .build();


        GroupMember owner = new GroupMember(user, group);
        owner.setGroupRole(GroupRole.ADMIN);

        group.getGroupMembers().add(owner);

        groupRepository.save(group);
        return new GroupResponse(group);
    }

    public GroupMemberResponse joinGroup(String token, Long groupId) {
        User user = authenticationService.getUserFromToken(token);
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

    public void handleJoinRequest(String token, Long targetUserId, Long groupId, boolean accepted) {
        User user = authenticationService.getUserFromToken(token);
        Group group = getGroupByGroupIdOrThrow(groupId);
        List<GroupRole> rolesList = new ArrayList<GroupRole>();
        rolesList.add(GroupRole.ADMIN);
        rolesList.add(GroupRole.MODERATOR);

        if (!hasRequiredRoleInGroup(user, group,rolesList)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"unauthorized");
        }

        GroupMember targetMember = getGroupMemberByUserAndGroup(userService.findUserByIdOrThrow(targetUserId),group);

        if (targetMember.isValid()) throw new ResponseStatusException(HttpStatus.CONFLICT, "already_in_group");
        if (accepted) {
            targetMember.setValid(true);
            groupMemberRepository.save(targetMember);
        } else {
            groupMemberRepository.delete(targetMember);
        }
    }

    public void leaveGroup(String token, Long groupId) {
        User user = authenticationService.getUserFromToken(token);
        Group group = getGroupByGroupIdOrThrow(groupId);
        Optional<GroupMember> groupMember = groupMemberRepository.getByUserAndGroup(user,group);

        if (groupMember.isEmpty()) throw new ResponseStatusException(HttpStatus.CONFLICT, "not_in_group");

        if (group.getGroupMembers().stream().anyMatch(member -> member.getGroupRole().equals(GroupRole.ADMIN) && member.getUser() != user)) {
            groupMemberRepository.delete(groupMember.get());
        }
        throw new ResponseStatusException(HttpStatus.CONFLICT, "cannot leave group if you are the only admin");
    }

    public void deleteGroup(String token, Long groupId) {
        GroupMember groupMember = getGroupMemberByUserAndGroup(
                authenticationService.getUserFromToken(token),
                getGroupByGroupIdOrThrow(groupId));
        if (groupMember.getGroupRole().equals(GroupRole.ADMIN)) {
            groupRepository.delete(groupMember.getGroup());
        } else throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"unauthorized");
    }

    public GroupMemberResponse setRoleOfMember(String token, Long groupId, Long targetUserId, GroupRole groupRole) {
        Group group = getGroupByGroupIdOrThrow(groupId);
        GroupMember user = getGroupMemberByUserAndGroup( authenticationService.getUserFromToken(token),group);
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



    /// helló, post controllerbe mennek ezek

    public PostResponse addPostToGroup(String token, Long groupId, CreatePostDto createPostDto) {
        GroupMember groupMember = getGroupMemberByUserAndGroup(
                authenticationService.getUserFromToken(token),
                getGroupByGroupIdOrThrow(groupId));
        if (!groupMember.isValid()) throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"unauthorized");



        List<Image> imageList =
        createPostDto.getPostImages().stream().map(postImage -> {
           return Image
                    .builder()
                    .index(createPostDto.getPostImages().indexOf(postImage))
                    .url(postImage.getUrl())
                    .deleteHash(postImage.getDeleteHash())
                    .build();
//            tempPost.getImages().add(tempImage);
        }).toList();

        Post tempPost = Post.builder()
                .postType(PostType.GROUPPOST)
                .text(createPostDto.getText())
                .groupMember(groupMember)
                .images(imageList)
                .location(createPostDto.getLocation())
                .build();
        postRepository.save(tempPost);

        return new PostResponse(tempPost);
    }
}
