package com.auo.backend.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "app_comments")
public class Comment {
    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "post_id")
    private Post post;

    @NotNull
    private String text;

    @OneToMany(mappedBy = "parent")
    private List<CommentReply> replies;

    private LocalDateTime time;

    @OneToMany
    private List<Reaction> reactions;

    @PrePersist
    protected void onCreate() {
        this.time =  LocalDateTime.now();
    }
}
