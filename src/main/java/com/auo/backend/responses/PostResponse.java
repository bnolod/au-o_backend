package com.auo.backend.responses;

import com.auo.backend.enums.PostType;
import com.auo.backend.models.Group;
import com.auo.backend.models.Post;
import com.auo.backend.models.Image;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PostResponse {
    UUID post_id;
    String text;
    int reaction_count;
    LocalDateTime date_of_creation;
    LocalDateTime date_of_update;
    PostType post_type;
    UserResponse user;
    String location;
    Group group;
    Integer relevance;
    List<Image> images;

    public PostResponse(Post post) {
        this.post_id = post.getId();
        this.text = post.getText();
//        this.reaction_count = post.getReactionCount();
        this.date_of_creation = post.getDateOfCreation();
        this.date_of_update = post.getDateOfUpdate();
        this.post_type = post.getPostType();
        this.user = new UserResponse(post.getUser());
        this.location = post.getLocation();
//        this.group = post.getGroupMember().getGroup()
        this.images = post.getImages();
    }

}
