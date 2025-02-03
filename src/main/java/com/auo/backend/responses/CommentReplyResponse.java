package com.auo.backend.responses;

import com.auo.backend.models.CommentReply;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommentReplyResponse {
    private Long id;
    private LocalDateTime time;
    private UserResponse user;
    private String text;

    public CommentReplyResponse(CommentReply commentReply) {
        this.id = commentReply.getId();
        this.time = commentReply.getTime();
        this.user = new UserResponse(commentReply.getUser());
        this.text = commentReply.getText();
    }
}
