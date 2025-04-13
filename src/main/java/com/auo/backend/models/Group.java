package com.auo.backend.models;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"groupMembers","groupMessages"})
@Entity
@Table(name = "app_group", indexes = {
        @Index(name = "index_group_name",columnList = "group_name")
})
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

    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL,
            orphanRemoval=true, fetch = FetchType.EAGER)
    private List<GroupEvent> groupEvents;

    @NotNull
    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL,
            orphanRemoval=true, fetch = FetchType.EAGER)
    @JsonManagedReference
    private List<GroupMember> groupMembers = new ArrayList<>();

    @OneToMany(mappedBy = "group", cascade = CascadeType.ALL, orphanRemoval = true)
    protected List<GroupMessage> groupMessages;

    @PrePersist
    protected void onCreate() {
        this.creationDate = LocalDateTime.now();
        if (this.groupMembers == null) {
            this.groupMembers = new ArrayList<>();
        }
    }
}
