package com.auo.backend.models;

import com.auo.backend.enums.GroupRole;
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

    @NotNull
    @Column(name="group_id")
    private UUID groupId;

    @NotNull
    @Column(name = "user_id")
    private Long userId;

    @NotNull
    private GroupRole groupRole;

    @NotNull
    private LocalDateTime joinedDate;

    @ManyToMany
    @JoinTable
    private List<Post> posts;

    @PrePersist
    protected void onCreate() {
        this.joinedDate = LocalDateTime.now();
    }
}
