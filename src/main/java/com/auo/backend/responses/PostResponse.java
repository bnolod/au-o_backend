package com.auo.backend.responses;

import com.auo.backend.enums.PostType;
import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.*;
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
public class PostResponse {
    Long postId;
    String text;
    Map<ReactionType,Long> reactionTypeMap;
    LocalDateTime dateOfCreation;
    LocalDateTime dateOfUpdate;
    PostType postType;
    UserResponse user;
    String location;
    Group group;
    Integer relevance;
    List<Image> images;
    List<CommentResponse> comments;

    public PostResponse(Post post) {
        this.postId = post.getId();
        this.text = post.getText();
        if (post.getReactions() != null)
            this.reactionTypeMap = post.getReactions().stream()
                .collect(Collectors.groupingBy(Reaction::getReactionType, Collectors.counting()));
        this.dateOfCreation = post.getDateOfCreation();
        this.dateOfUpdate = post.getDateOfUpdate();
        this.postType = post.getPostType();
        this.user = new UserResponse(post.getUser());
        this.location = post.getLocation();
//        this.group = post.getGroupMember().getGroup()
        this.images = post.getImages();
        if (post.getComments() != null)
            this.comments = post.getComments().stream().map(CommentResponse::new).toList();
    }

}
