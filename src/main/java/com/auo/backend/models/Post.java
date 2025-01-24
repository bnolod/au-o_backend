package com.auo.backend.models;

import com.auo.backend.enums.PostType;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jdk.jfr.Relational;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
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
    private UUID postId;

    private String text;

    @NotNull
    private Long reactionCount;

    @NotNull
    private LocalDateTime dateOfCreation;

    @NotNull
    private LocalDateTime dateOfUpdate;

    @NotNull
    private PostType postType;

//    private Long groupId;

    @NotNull
    private Long relevance;


    @PrePersist
    protected void onCreate() {
        this.dateOfCreation = LocalDateTime.now();
        this.dateOfUpdate = LocalDateTime.now();
        this.relevance = 0L;
    }
}
