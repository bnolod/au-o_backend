package com.auo.backend.models;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
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
    private Long id;

    private String groupName;

    private String groupDescription;

    private String bannerImageURL;

    private LocalDateTime creationDate;

    private boolean isPublic;

    private String groupAlias;

    @NotNull
    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL,
            orphanRemoval=true)
    @JsonManagedReference
    private List<GroupMember> groupMembers = new ArrayList<>();

    @PrePersist
    protected void onCreate() {
        this.creationDate = LocalDateTime.now();
        this.isPublic = true;
        if (this.groupMembers == null) {
            this.groupMembers = new ArrayList<>();
        }
    }
}
