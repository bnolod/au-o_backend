package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.dto.CreateGroupDto;
import com.auo.backend.enums.GroupRole;
import com.auo.backend.models.Group;
import com.auo.backend.models.GroupMember;
import com.auo.backend.models.User;
import com.auo.backend.repositories.GroupMemberRepository;
import com.auo.backend.repositories.GroupRepository;
import com.auo.backend.responses.GroupResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class GroupService {

    private final GroupRepository groupRepository;
    private final AuthenticationService authenticationService;
    private final GroupMemberRepository groupMemberRepository;

    public List<Group> getAllGroups() {
        return groupRepository.findAll();
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
}
