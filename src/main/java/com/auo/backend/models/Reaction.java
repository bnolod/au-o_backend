package com.auo.backend.models;


import com.auo.backend.enums.ReactionType;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Builder
@Table(name = "app_reactions")
public class Reaction {
    @Id
    @GeneratedValue
    Long id;

    @NotNull
    ReactionType reactionType;

    @ManyToOne
    User user;

    @NotNull
    LocalDateTime time;

    @PrePersist
    protected void onCreate() {
        this.time = LocalDateTime.now();
    }

//    @ManyToOne
//    Post post;
//
//    @ManyToOne
//    Comment comment;
//
//    @ManyToOne()
//    CommentReply commentReply;
}
