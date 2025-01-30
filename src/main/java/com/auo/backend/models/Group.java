package com.auo.backend.models;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "app_group")
public class Group {
    @Id
    @GeneratedValue
    private UUID uuid;

    private String groupName;

    private String groupDescription;

    private String bannerImageURL;

//    private int memberCount;

    private LocalDateTime creationDate;

    private boolean isPublic;

    private String groupAlias;

    @OneToMany(mappedBy = "group")
    private List<GroupMember> groupMembers;

    @PrePersist
    protected void onCreate() {
        this.creationDate = LocalDateTime.now();
        this.isPublic = true;
    }
}
