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
    private Group group;

    @ManyToOne
    private User user;

    @NotNull
    private GroupRole groupRole;

    @NotNull
    private LocalDateTime joinedDate;

    @OneToMany
    private List<Post> posts;

//    public void removePost(Post post) {
//        this.posts.remove(post);
//    }
//
//    public void addPost(Post post) {
//        this.posts.add(post);
//    }

    @PrePersist
    protected void onCreate() {
        this.joinedDate = LocalDateTime.now();
    }
}
