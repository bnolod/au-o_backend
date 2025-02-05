package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.auth.GenericOwnershipCheckerService;
import com.auo.backend.dto.CreateGroupDto;
import com.auo.backend.enums.GroupRole;
import com.auo.backend.enums.UserRole;
import com.auo.backend.models.Group;
import com.auo.backend.models.GroupMember;
import com.auo.backend.models.User;
import com.auo.backend.repositories.GroupMemberRepository;
import com.auo.backend.repositories.GroupRepository;
import com.auo.backend.responses.GroupResponse;
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

    public List<Group> getAllGroups() {
        return groupRepository.findAll();
    }

    public GroupMember getGroupMemberById(Long id) {
        Optional<GroupMember> optionalGroupMember= groupMemberRepository.findById(id);
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

    public void joinGroup(String token, Long groupId) {
        User user = authenticationService.getUserFromToken(token);
        Optional<Group> optionalGroup = groupRepository.findById(groupId);

        if (optionalGroup.isEmpty()) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "group_not_found");

        Group group = optionalGroup.get();
        if (group.getGroupMembers().stream().anyMatch(groupMember -> groupMember.getUser().equals(user))) {
            throw new ResponseStatusException(HttpStatus.CONFLICT,"already_in_group");
        }

        GroupMember groupMember = new GroupMember(user,group);
        groupMember.setValid(group.isPublic());
        group.getGroupMembers().add(groupMember);
        groupRepository.save(group);
    }

    public void approveJoinRequest(String token, Long groupMemberId) {
        User user = authenticationService.getUserFromToken(token);
        GroupMember groupMember = getGroupMemberById(groupMemberId);

        List<GroupRole> rolesList = new ArrayList<GroupRole>();
        rolesList.add(GroupRole.ADMIN);
        rolesList.add(GroupRole.MODERATOR);

        if (!hasRequiredRoleInGroup(user, groupMember.getGroup(),rolesList)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED,"unauthorized");
        }

        if (groupMember.isValid()) throw new ResponseStatusException(HttpStatus.CONFLICT, "already_in_group");

        groupMember.setValid(true);
        groupMemberRepository.save(groupMember);
    }

    public void leaveGroup(String token, Long groupId) {

    }
}
