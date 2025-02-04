package com.auo.backend.models;

import com.auo.backend.enums.GroupRole;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "app_group_members")
public class GroupMember {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    @JoinColumn(name = "group_id", nullable = false)
    private Group group;

    @ManyToOne
    private User user;

    @NotNull
    private GroupRole groupRole;

    @NotNull
    private LocalDateTime joinedDate;

    @OneToMany(cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<Post> posts;

    private Boolean isValid;


    @PrePersist
    protected void onCreate() {
        if(this.isValid == null) {
            this.isValid = true;
        }
        this.joinedDate = LocalDateTime.now();
    }

    public GroupMember(User user, Group group) {
        this.group = group;
        this.user = user;
        this.groupRole = GroupRole.MEMBER;
    }
}
