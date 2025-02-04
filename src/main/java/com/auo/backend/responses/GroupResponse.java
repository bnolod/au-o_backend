package com.auo.backend.responses;

import com.auo.backend.models.Group;
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
    private String bannerImage;
    private int memberCount;
    private boolean isPublic;
    private LocalDateTime creationDate;

    public GroupResponse(Group group) {
        this.id = group.getId();
        this.name = group.getGroupName();
        this.alias = group.getGroupAlias();
        this.bannerImage = group.getBannerImageURL();
        this.memberCount = group.getGroupMembers().size();
        this.isPublic = group.isPublic();
        this.creationDate = group.getCreationDate();
    }
}
