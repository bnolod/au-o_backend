package com.auo.backend.models;


import com.auo.backend.enums.ReactionType;
import com.fasterxml.jackson.annotation.JsonBackReference;
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
    @JsonBackReference
    User user;


//    @ManyToOne
//    Post post;
//
//    @ManyToOne
//    Comment comment;
//
//    @ManyToOne()
//    CommentReply commentReply;
}
