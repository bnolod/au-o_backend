package com.auo.backend.responses;

import com.auo.backend.enums.PostType;
import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.*;
import com.auo.backend.services.GenericReactionService;
import jakarta.validation.constraints.Null;
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

    private Long postId;
    private String text;
    private Map<ReactionType,Long> reactionTypeMap;
    private LocalDateTime dateOfCreation;
    private LocalDateTime dateOfUpdate;
    private PostType postType;
    private UserResponse user;
    private String location;
    private GroupResponse group;
    private Integer relevance;
    private List<Image> images;
    private List<CommentResponse> comments;
    private ReactionType reactedWith;
    private VehicleResponse vehicle;
    private boolean isFavorite;


    public PostResponse(Post post, User currentUser) {
        this.postId = post.getId();
        this.text = post.getText();

        if (post.getReactions() != null) {
            this.reactionTypeMap = post.getReactions().stream()
                    .collect(Collectors.groupingBy(Reaction::getReactionType, Collectors.counting()));

            this.reactedWith = post.getReactions().stream()
                    .filter(reaction -> reaction.getUser().getId().equals(currentUser.getId()))
                    .map(Reaction::getReactionType)
                    .findFirst()
                    .orElse(null);
        }

        this.dateOfCreation = post.getDateOfCreation();
        this.dateOfUpdate = post.getDateOfUpdate();
        this.postType = post.getPostType();
        this.location = post.getLocation();

        if (post.getGroupMember() != null) {
            this.group = new GroupResponse( post.getGroupMember().getGroup(), currentUser);
            this.user = new UserResponse(post.getGroupMember().getUser());
        } else {
            this.user = new UserResponse(post.getUser());
        }

        this.images = post.getImages();

        if (post.getComments() != null) {
            this.comments = post.getComments().stream().map(comment -> new CommentResponse(comment,currentUser)).toList();
        }

        if (post.getVehicle() == null) {
            this.vehicle = null;
        } else {
            this.vehicle = new VehicleResponse(post.getVehicle(),null);
        }

        this.isFavorite = currentUser.getFavoritePosts().stream().anyMatch(favPost -> favPost.getPost() == post);
    }

}
