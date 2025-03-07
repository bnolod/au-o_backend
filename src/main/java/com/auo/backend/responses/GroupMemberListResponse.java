package com.auo.backend.responses;

import com.auo.backend.models.Group;
import com.auo.backend.models.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GroupMemberListResponse {
    private GroupResponse group;
    private List<GroupUserResponse> users;

    public GroupMemberListResponse(Group group, User user, List<GroupUserResponse> list) {
        this.group = new GroupResponse(group, user);
        this.users = list;
    }
}

