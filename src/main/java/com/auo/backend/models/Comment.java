package com.auo.backend.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString(exclude = {"post"})
//@EqualsAndHashCode(exclude = "user")
@Table(name = "app_comments")
public class Comment {
    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    @JsonBackReference
    private User user;

    @NotNull
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "post_id")
    @JsonBackReference
    private Post post;

    @NotNull
    private String text;

    @OneToMany(mappedBy = "parent", cascade = CascadeType.ALL,
            orphanRemoval=true)
    private List<CommentReply> replies;

    private LocalDateTime time;

    @OneToMany(cascade = CascadeType.ALL)
    private List<Reaction> reactions  = new ArrayList<>();

    @PrePersist
    protected void onCreate() {
        this.time =  LocalDateTime.now();
    }
}
