package com.auo.backend.responses;

import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.Comment;
import com.auo.backend.models.CommentReply;
import com.auo.backend.models.Reaction;
import com.auo.backend.models.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommentResponse {
    private Long id;
    private LocalDateTime time;
    private UserResponse user;
    private String text;
    private List<CommentReplyResponse> replies;
    private Map<ReactionType,Long> reactionTypeMap;
    private ReactionType reactedWith;

    public CommentResponse(Comment comment, User user) {
        this.id = comment.getId();
        this.time = comment.getTime();
        this.user = new UserResponse(comment.getUser());
        this.text = comment.getText();
        this.replies = comment.getReplies().stream().map(reply -> new CommentReplyResponse(reply,user)).toList();
        if (comment.getReactions() != null) {
            this.reactionTypeMap = comment.getReactions().stream()
                    .collect(Collectors.groupingBy(Reaction::getReactionType, Collectors.counting()));

            this.reactedWith = comment.getReactions().stream()
                    .filter(reaction -> reaction.getUser().equals(user))
                    .map(Reaction::getReactionType)
                    .findFirst()
                    .orElse(null);
        }
    }

}
