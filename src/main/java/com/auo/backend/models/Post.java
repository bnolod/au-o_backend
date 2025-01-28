package com.auo.backend.models;

import com.auo.backend.enums.PostType;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "app_post")
public class Post {
    @Id
    @GeneratedValue()
    @Column(name = "post_id")
    private UUID postId;

    private String text;

    @NotNull
    private int reactionCount;

    @NotNull
    private LocalDateTime dateOfCreation;

    @NotNull
    private LocalDateTime dateOfUpdate;

    @NotNull
    private PostType postType;
//
    @OneToMany
//    @JoinTable(name = "app_post_images",
//    joinColumns = @JoinColumn(name = "post_id"))
    private List<PostImages> images;

    private String location;

//    private Long groupId;

    @NotNull
    private int relevance;

    @ManyToOne
//    @JoinTable(name = "app_user_posts",
//    joinColumns = @JoinColumn(name = "user_id"))
    private User user;

    @ManyToOne
    private GroupMember groupMember;


    @PrePersist
    protected void onCreate() {
        this.dateOfCreation = LocalDateTime.now();
        this.dateOfUpdate = LocalDateTime.now();
        this.relevance = 1;
        this.reactionCount = 0;
        this.images = new ArrayList<>();

    }



}
