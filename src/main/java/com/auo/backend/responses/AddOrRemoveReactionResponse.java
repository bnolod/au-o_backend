package com.auo.backend.responses;

import com.auo.backend.enums.ReactionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AddOrRemoveReactionResponse {
    private ReactionType reactionType;
    private String message;
}
