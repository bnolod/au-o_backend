package com.auo.backend.controllers;


import com.auo.backend.dto.AddCommentDto;
import com.auo.backend.dto.CreatePostDto;
import com.auo.backend.dto.UpdatePostDto;
import com.auo.backend.enums.ReactionType;
import com.auo.backend.repositories.PostRepository;
import com.auo.backend.responses.AddOrRemoveReactionResponse;
import com.auo.backend.responses.CommentReplyResponse;
import com.auo.backend.responses.CommentResponse;
import com.auo.backend.responses.PostResponse;
import com.auo.backend.services.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<List<PostResponse>> getAllPosts() {
        return ResponseEntity.ok(this.postService.getAllPosts());
    }

    @GetMapping("/post/{postId}")
    public ResponseEntity<PostResponse> getOnePostById(@PathVariable Long postId) {
        return ResponseEntity.ok(this.postService.getPostById(postId));
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

}
