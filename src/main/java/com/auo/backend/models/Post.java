package com.auo.backend.models;

import com.auo.backend.enums.PostType;
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
import java.util.concurrent.atomic.AtomicInteger;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "app_posts")
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

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Image> images;

    private String location;

//    @NotNull
//    private int relevance;
    
    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL)
    private List<Comment> comments;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "group_member_id")
    private GroupMember groupMember;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Reaction> reactions = new ArrayList<>();


    @PrePersist
    protected void onCreate() {
        this.dateOfCreation = LocalDateTime.now();
        this.dateOfUpdate = LocalDateTime.now();
//        this.relevance = 1;
//        this.reactionCount = 0;
        this.images = new ArrayList<>();

    }

    public Integer getRelevance(LocalDateTime time) {
        AtomicInteger relevance = new AtomicInteger();
        this.comments.forEach(comment -> {
            relevance.addAndGet(1+
                    comment.getReplies().size());
        });
        return relevance.get();
    }
}
