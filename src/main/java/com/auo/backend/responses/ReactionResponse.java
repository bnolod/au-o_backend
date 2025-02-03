package com.auo.backend.responses;

import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.Reaction;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReactionResponse {
    private ReactionType reactionType;
    private UserResponse user;

    public ReactionResponse(Reaction reaction) {
        this.reactionType = reaction.getReactionType();
        this.user = new UserResponse(reaction.getUser());
    }
}
