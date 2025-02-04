package com.auo.backend.responses;

import com.auo.backend.enums.PostType;
import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PostResponse {
    Long post_id;
    String text;
    Map<ReactionType,Long> reactionTypeMap;
    LocalDateTime date_of_creation;
    LocalDateTime date_of_update;
    PostType post_type;
    UserResponse user;
    String location;
    Group group;
    Integer relevance;
    List<Image> images;
    List<CommentResponse> comments;

    public PostResponse(Post post) {
        this.post_id = post.getId();
        this.text = post.getText();
        if (post.getReactions() != null)
            this.reactionTypeMap = post.getReactions().stream()
                .collect(Collectors.groupingBy(Reaction::getReactionType, Collectors.counting()));
        this.date_of_creation = post.getDateOfCreation();
        this.date_of_update = post.getDateOfUpdate();
        this.post_type = post.getPostType();
        this.user = new UserResponse(post.getUser());
        this.location = post.getLocation();
//        this.group = post.getGroupMember().getGroup()
        this.images = post.getImages();
        if (post.getComments() != null)
            this.comments = post.getComments().stream().map(CommentResponse::new).toList();
    }

}
