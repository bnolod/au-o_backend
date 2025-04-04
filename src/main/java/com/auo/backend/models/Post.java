package com.auo.backend.models;

import com.auo.backend.enums.PostType;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString(exclude = "user")
@EqualsAndHashCode(exclude = "user")
@Table(name = "app_posts", indexes = {
        @Index(name = "index_post_user",columnList = "user_id"),
        @Index(name = "index_post_vehicle", columnList = "vehicle_id"),
        @Index(name = "index_post_post_type", columnList = "post_type"),
        @Index(name = "index_post_group_member",columnList = "group_member_id")
})
public class Post {
    @Id
    @GeneratedValue()
    @Column(name = "id")
    private Long id;

    private String text;

//    @NotNull
//    private int reactionCount;

    @NotNull
    private LocalDateTime dateOfCreation;

    @NotNull
    private LocalDateTime dateOfUpdate;

    @NotNull
    private PostType postType;

    @OneToMany( cascade = CascadeType.ALL,
            orphanRemoval=true)
//    @JsonManagedReference
    private List<Image> images;

    private String location;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<Comment> comments;

    @ManyToOne
    @JsonBackReference("user-posts")
    @JoinColumn(name = "user_id")
    private User user;


    @ManyToOne
    @JsonBackReference("groupmember-posts")
    @JoinColumn(name = "group_member_id")
    private GroupMember groupMember;

    @OneToMany(cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<Reaction> reactions = new ArrayList<>();

    @ManyToOne
    private Vehicle vehicle;

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL,
            orphanRemoval=true, fetch = FetchType.LAZY)
    private List<FavoritePost> favoritePosts;


    @PrePersist
    protected void onCreate() {
        this.dateOfCreation = LocalDateTime.now();
        this.dateOfUpdate = LocalDateTime.now();
        this.comments = new ArrayList<>();
        if (this.images==null) this.images = new ArrayList<>();

    }
}
