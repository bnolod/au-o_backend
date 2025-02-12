package com.auo.backend.responses;

import com.auo.backend.enums.GroupRole;
import com.auo.backend.models.GroupMember;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GroupMemberResponse {
    private GroupResponse group;
    private UserResponse user;
    private GroupRole role;
    private LocalDateTime joinedDate;
    private boolean isValid;

    public GroupMemberResponse(GroupMember groupMember) {
        this.group = new GroupResponse(groupMember.getGroup(),groupMember.getUser());
        this.user = new UserResponse(groupMember.getUser());
        this.role = groupMember.getGroupRole();
    }

}
