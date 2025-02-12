package com.auo.backend.controllers;


import com.auo.backend.dto.create.AddCommentDto;
import com.auo.backend.dto.create.CreatePostDto;
import com.auo.backend.dto.update.UpdatePostDto;
import com.auo.backend.enums.ReactionType;
import com.auo.backend.repositories.PostRepository;
import com.auo.backend.responses.*;
import com.auo.backend.services.PostService;
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
    public ResponseEntity<PostResponse> publishPostToProfile(@RequestBody CreatePostDto createPostDto,
                                                             @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        System.out.println("hali");
        return ResponseEntity.ok(this.postService.publishPostToProfile(createPostDto,token));
    }

    @GetMapping("/all")
    public ResponseEntity<List<PostResponse>> getAllPosts(@RequestHeader(HttpHeaders.AUTHORIZATION)String token) {
        return ResponseEntity.ok(this.postService.getAllPosts(token));
    }

    @GetMapping("/feed")
    public ResponseEntity<PageResponse<PostResponse>> getPageForFeed(@RequestHeader(HttpHeaders.AUTHORIZATION) String token,
                                                                     @RequestParam int page,
                                                                     @RequestParam LocalDateTime time) {
        return ResponseEntity.ok(postService.getPostFeedOfUser(token,page,time));
    }

    @GetMapping("/post/{postId}")
    public ResponseEntity<PostResponse> getOnePostById(@PathVariable Long postId,
                                                       @RequestHeader(HttpHeaders.AUTHORIZATION)String token) {
        return ResponseEntity.ok(this.postService.getPostById(postId, token));
    }

    @PutMapping("/post/{postId}")
    public ResponseEntity<PostResponse> updatePostOfUserById(@PathVariable Long postId,
                                                             @RequestHeader(HttpHeaders.AUTHORIZATION) String token,
                                                             @RequestBody UpdatePostDto updatePostDto) {
        return ResponseEntity.ok(this.postService.updatePostOfUserById(postId,token,updatePostDto));
    }

    @DeleteMapping("/post/{postId}")
    public ResponseEntity<PostResponse> deletePostOfUserById(@PathVariable Long postId,
                                                             @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        return ResponseEntity.ok(this.postService.deletePostOfUserById(postId,token));
    }

    @DeleteMapping("/post/comment/{commentId}")
    public void deleteCommentFromPost(@PathVariable Long commentId,
                                      @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        postService.removeCommentFromPost(token,commentId);
    }

    @PostMapping("/post/{postId}/comment")
    public ResponseEntity<CommentResponse> commentToPost(@PathVariable Long postId,
                                                         @RequestHeader(HttpHeaders.AUTHORIZATION) String token,
                                                         @RequestBody AddCommentDto text) {
        return ResponseEntity.ok(postService.addCommentToPost(token,postId,text));
    }

    @PostMapping("post/{postId}/addOrRemoveReaction/{reactionType}")
    public ResponseEntity<AddOrRemoveReactionResponse> addReactionToPost (@PathVariable Long postId,
                                                          @PathVariable ReactionType reactionType,
                                                          @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        return ResponseEntity.ok(postService.addOrRemoveReaction(postId,reactionType,token));
    }

    @PostMapping("post/comment/{commentId}/reply")
    public ResponseEntity<CommentReplyResponse> replyToComment(@PathVariable Long commentId,
                                                               @RequestHeader(HttpHeaders.AUTHORIZATION) String token,
                                                               @RequestBody AddCommentDto addCommentDto) {
        return ResponseEntity.ok(postService.replyToComment(commentId,token,addCommentDto.getText()));
    }
    @DeleteMapping("post/comment/reply/{replyId}")
    public ResponseEntity<CommentReplyResponse> deleteReplyFromComment(@PathVariable Long replyId,
                                                                       @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        return ResponseEntity.ok(postService.deleteReplyFromComment(replyId,token));
    }

}
