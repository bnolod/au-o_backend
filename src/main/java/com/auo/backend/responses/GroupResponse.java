package com.auo.backend.responses;

import com.auo.backend.models.Group;
import com.auo.backend.models.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GroupResponse {
    private Long id;
    private String name;
    private String alias;
    private String description;
    private String bannerImage;
    private int memberCount;
    private boolean isPublic;
    private LocalDateTime creationDate;
    private boolean isMember;
    private boolean isValidMember;

    public GroupResponse(Group group, User user) {
        this.id = group.getId();
        this.name = group.getGroupName();
        this.alias = group.getGroupAlias();
        this.description = group.getGroupDescription();
        this.bannerImage = group.getBannerImageURL();
        this.memberCount = group.getGroupMembers().size();
        this.isPublic = group.isPublic();
        this.creationDate = group.getCreationDate();
        this.isMember = group.getGroupMembers().stream().anyMatch(member -> member.getUser().equals(user));
        this.isValidMember = group.getGroupMembers().stream().anyMatch(member -> member.getUser().equals(user) && member.isValid());
    }
}
