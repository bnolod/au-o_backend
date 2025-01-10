package com.auo.backend.user.posts.comments;

import jakarta.persistence.Column;
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
}
