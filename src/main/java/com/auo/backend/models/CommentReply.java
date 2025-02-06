package com.auo.backend.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"user","parent"})
@Entity
@Table(name = "app_comment_replies")
public class CommentReply {
    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "comment_id")
    @JsonBackReference
    private Comment parent;

    @ManyToOne
    @JoinColumn(name = "user_id")
    @JsonBackReference
    private User user;

    private String text;

    private LocalDateTime time;

    @OneToMany
    private List<Reaction> reactions = new ArrayList<>();


    @PrePersist
    protected void onCreate() {
        this.time =  LocalDateTime.now();
    }

}
