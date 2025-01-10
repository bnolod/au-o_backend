package com.auo.backend.user.posts;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import java.util.Date;

@Entity
@Table(name = "app_user_posts")
public class UserPost {
    @Id
    private Long post_id;
    private Long user_id;
    private String text;
    private Integer reaction_count;
    private Date creation_date;
    private Date modified_date;
}
