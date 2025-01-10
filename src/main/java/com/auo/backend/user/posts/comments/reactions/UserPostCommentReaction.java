package com.auo.backend.user.posts.comments.reactions;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "app_user_post_comment_reactions")
public class UserPostCommentReaction {
    @Id
    private Long id;
    private Long comment_id;
    private Long user_id;
    private Long reaction_id;

    public UserPostCommentReaction() {
    }

    public UserPostCommentReaction(Long comment_id, Long user_id, Long reaction_id) {
        this.comment_id = comment_id;
        this.user_id = user_id;
        this.reaction_id = reaction_id;
    }

    public UserPostCommentReaction(Long id, Long comment_id, Long user_id, Long reaction_id) {
        this.id = id;
        this.comment_id = comment_id;
        this.user_id = user_id;
        this.reaction_id = reaction_id;
    }
}
