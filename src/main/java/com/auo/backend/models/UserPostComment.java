package com.auo.backend.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_post_comments")
public class UserPostComment {
    @Id
    private Long comment_id;
    private Long user_id;
    private Long post_id;
    private String text;
    private Long parent_comment_id;

    public UserPostComment() {
    }

    public UserPostComment(Long user_id, Long post_id, String text, Long parent_comment_id) {
        this.user_id = user_id;
        this.post_id = post_id;
        this.text = text;
        this.parent_comment_id = parent_comment_id;
    }

    public UserPostComment(Long comment_id, Long user_id, Long post_id, String text, Long parent_comment_id) {
        this.comment_id = comment_id;
        this.user_id = user_id;
        this.post_id = post_id;
        this.text = text;
        this.parent_comment_id = parent_comment_id;
    }
}
