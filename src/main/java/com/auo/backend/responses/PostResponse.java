package com.auo.backend.responses;

import com.auo.backend.enums.PostType;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PostResponse {
    UUID post_id;
    Long user_id;
    String text;
    Long reactionCount;
    LocalDateTime date_of_creation;
    LocalDateTime date_of_update;
    PostType post_type;
    Long group_id;
}
