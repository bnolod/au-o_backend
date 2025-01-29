package com.auo.backend.models;

import com.auo.backend.enums.PostType;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
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
    @Column(name = "id")
    private UUID id;

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
    @OneToMany(mappedBy = "post")
    @JsonManagedReference
    private List<PostImages> images;

    private String location;

    @NotNull
    private int relevance;


    @OneToMany(mappedBy = "post")
    private List<Comment> comments;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "group_member_id")
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
