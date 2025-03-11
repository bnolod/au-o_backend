package com.auo.backend.controllers;


import com.auo.backend.dto.create.AddCommentDto;
import com.auo.backend.dto.create.CreatePostDto;
import com.auo.backend.dto.update.UpdatePostDto;
import com.auo.backend.enums.ReactionType;
import com.auo.backend.repositories.PostRepository;
import com.auo.backend.responses.*;
import com.auo.backend.services.PostService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping(path = "api/v1/posts")
public class PostController {
    private final PostRepository postRepository;

    private final PostService postService;

    @PostMapping("/post/user")
    public ResponseEntity<PostResponse> publishPostToProfile(@Valid @RequestBody CreatePostDto createPostDto) {
        System.out.println("hali");
        return ResponseEntity.ok(this.postService.publishPostToProfile(createPostDto));
    }

    @GetMapping("/all")
    public ResponseEntity<List<PostResponse>> getAllPosts() {
        return ResponseEntity.ok(this.postService.getAllPosts());
    }

    @GetMapping("/feed")
    public ResponseEntity<PageResponse<PostResponse>> getPageForFeed(@RequestParam int page,
                                                                     @RequestParam LocalDateTime time) {
        return ResponseEntity.ok(postService.getPostFeedOfUser(page,time));
    }

    @GetMapping("/vehicle/{vehicleId}")
    public ResponseEntity<List<PostResponse>> getPostsByVehicleId(@PathVariable Long vehicleId) {
        return ResponseEntity.ok(postService.getPostsByVehicleId(vehicleId));
    }

    @GetMapping("/post/{postId}")
    public ResponseEntity<PostResponse> getOnePostById(@PathVariable Long postId) {
        return ResponseEntity.ok(this.postService.getPostById(postId));
    }

    @PutMapping("/post/{postId}")
    public ResponseEntity<PostResponse> updatePostOfUserById(@PathVariable Long postId,
                                                             @Valid @RequestBody UpdatePostDto updatePostDto) {
        return ResponseEntity.ok(this.postService.updatePostOfUserById(postId,updatePostDto));
    }

    @DeleteMapping("/post/{postId}")
    public ResponseEntity<PostResponse> deletePostOfUserById(@PathVariable Long postId) {
        return ResponseEntity.ok(this.postService.deletePostOfUserById(postId));
    }

    @DeleteMapping("/post/comment/{commentId}")
    public void deleteCommentFromPost(@PathVariable Long commentId) {
        postService.removeCommentFromPost(commentId);
    }

    @PostMapping("/post/{postId}/comment")
    public ResponseEntity<CommentResponse> commentToPost(@PathVariable Long postId,
                                                         @Valid @RequestBody AddCommentDto text) {
        return ResponseEntity.ok(postService.addCommentToPost(postId,text));
    }

    @PostMapping("post/{postId}/addOrRemoveReaction/{reactionType}")
    public ResponseEntity<AddOrRemoveReactionResponse> addReactionToPost (@PathVariable Long postId,
                                                          @PathVariable ReactionType reactionType) {
        return ResponseEntity.ok(postService.addOrRemoveReaction(postId,reactionType));
    }

    @PostMapping("comment/{commentId}/addOrRemoveReaction/{reactionType}")
    public ResponseEntity<AddOrRemoveReactionResponse> addReactionToComment (@PathVariable Long commentId,
                                                                          @PathVariable ReactionType reactionType) {
        return ResponseEntity.ok(postService.addOrRemoveReactionToComment(commentId,reactionType));
    }

    @PostMapping("reply/{replyId}/addOrRemoveReaction/{reactionType}")
    public ResponseEntity<AddOrRemoveReactionResponse> addReactionToReply (@PathVariable Long replyId,
                                                                          @PathVariable ReactionType reactionType) {
        return ResponseEntity.ok(postService.addOrRemoveReactionToReply(replyId,reactionType));
    }

    @PostMapping("post/comment/{commentId}/reply")
    public ResponseEntity<CommentReplyResponse> replyToComment(@PathVariable Long commentId,
                                                               @Valid @RequestBody AddCommentDto addCommentDto) {
        return ResponseEntity.ok(postService.replyToComment(commentId,addCommentDto.getText()));
    }
    @DeleteMapping("post/comment/reply/{replyId}")
    public ResponseEntity<CommentReplyResponse> deleteReplyFromComment(@PathVariable Long replyId) {
        return ResponseEntity.ok(postService.deleteReplyFromComment(replyId));
    }

    @PostMapping("favorite/{postId}")
    public ResponseEntity<String> favoritePost(@PathVariable Long postId) {
        return ResponseEntity.ok(postService.favoritePost(postId));
    }

    @GetMapping("favorites/user/{userId}")
    public ResponseEntity<List<PostResponse>> getFavoritePostsOfUser(@PathVariable Long userId) {
        return ResponseEntity.ok(postService.getFavoritePostOfUserById(userId));
    }

}
