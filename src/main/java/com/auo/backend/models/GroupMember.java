package com.auo.backend.models;

import com.auo.backend.enums.GroupRole;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString(exclude = {"user","group","posts"})
@Table(name = "app_group_members", indexes = {
        @Index(name = "index_gm_user",columnList = "user_id"),
        @Index(name = "index_gm_group",columnList = "group_id")
})
public class GroupMember {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    @JoinColumn(name = "group_id", nullable = false)
    @JsonBackReference
    private Group group;

    @ManyToOne
    @JsonBackReference
    private User user;

    @NotNull
    private GroupRole groupRole;

    @NotNull
    private LocalDateTime joinedDate;

    @OneToMany(cascade = CascadeType.ALL,
            orphanRemoval=true)
    @JsonManagedReference
    private List<Post> posts;

    @NotNull
    private boolean isValid;


    @PrePersist
    protected void onCreate() {
        this.joinedDate = LocalDateTime.now();
    }

    public GroupMember(User user, Group group) {
        this.group = group;
        this.user = user;
        this.groupRole = GroupRole.MEMBER;
    }
}
