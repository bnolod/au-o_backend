package com.auo.backend.responses;

import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.CommentReply;
import com.auo.backend.models.Reaction;
import com.auo.backend.models.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Map;
import java.util.stream.Collectors;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommentReplyResponse {
    private Long id;
    private LocalDateTime time;
    private UserResponse user;
    private String text;
    private Map<ReactionType,Long> reactionTypeMap;
    private ReactionType reactedWith;

    public CommentReplyResponse(CommentReply commentReply, User user) {
        this.id = commentReply.getId();
        this.time = commentReply.getTime();
        this.user = new UserResponse(commentReply.getUser());
        this.text = commentReply.getText();

        if (commentReply.getReactions() != null) {
            this.reactionTypeMap = commentReply.getReactions().stream()
                    .collect(Collectors.groupingBy(Reaction::getReactionType, Collectors.counting()));

            this.reactedWith = commentReply.getReactions().stream()
                    .filter(reaction -> reaction.getUser().equals(user))
                    .map(Reaction::getReactionType)
                    .findFirst()
                    .orElse(null);
        }

    }
}
