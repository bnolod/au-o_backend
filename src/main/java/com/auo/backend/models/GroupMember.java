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
@ToString(exclude = {"user","group"})
@Table(name = "app_group_members")
public class GroupMember {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "group_id", nullable = false)
    @JsonBackReference
    private Group group;

    @ManyToOne(fetch = FetchType.EAGER)
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
