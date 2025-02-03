package com.auo.backend.responses;

import com.auo.backend.models.Comment;
import com.auo.backend.models.CommentReply;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

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

    public CommentResponse(Comment comment) {
        this.id = comment.getId();
        this.time = comment.getTime();
        this.user = new UserResponse(comment.getUser());
        this.text = comment.getText();
        this.replies = comment.getReplies().stream().map(CommentReplyResponse::new).toList();
    }

}
