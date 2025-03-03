package com.auo.backend.models;


import com.auo.backend.enums.ReactionType;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Builder
@ToString(exclude = {"user"})

@Table(name = "app_reactions")
public class Reaction {
    @Id
    @GeneratedValue
    Long id;

    @NotNull
    ReactionType reactionType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference("user-reactions")
    User user;
}
