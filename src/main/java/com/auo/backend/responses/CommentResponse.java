package com.auo.backend.responses;

import com.auo.backend.models.Comment;
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

    public CommentResponse(Comment comment) {
        this.id = comment.getId();
        this.time = comment.getTime();
        this.user = new UserResponse(comment.getUser());
        this.text = comment.getText();
    }

}
