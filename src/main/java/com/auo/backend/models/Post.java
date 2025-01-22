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
    UUID post_id;

    @NotNull
    Long user_id;

    String text;

    @NotNull
    Long reactionCount;

    @NotNull
    LocalDateTime dateOfCreation;

    @NotNull
    LocalDateTime dateOfUpdate;

    @NotNull
    PostType postType;

    Long groupId;

    @PrePersist
    protected void onCreate() {
        this.dateOfCreation = LocalDateTime.now();
        this.dateOfUpdate = LocalDateTime.now();
    }
}
