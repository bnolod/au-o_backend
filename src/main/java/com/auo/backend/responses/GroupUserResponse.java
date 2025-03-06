package com.auo.backend.responses;

import com.auo.backend.enums.GroupRole;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GroupUserResponse {
    private UserResponse user;
    private GroupRole role;
    private LocalDateTime joinedDate;
    private boolean isValid;

    public GroupUserResponse(GroupMemberResponse member) {
        this.user = member.getUser();
        this.role = member.getRole();
        this.joinedDate = member.getJoinedDate();
        this.isValid = member.isValid();
    }
}
