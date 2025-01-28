package com.auo.backend.controllers;


import com.auo.backend.dto.CreatePostDto;
import com.auo.backend.models.Post;
import com.auo.backend.repositories.PostRepository;
import com.auo.backend.services.PostService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping(path = "api/v1/posts")
public class PostController {
    private final PostRepository postRepository;

    private final PostService postService;

    @PostMapping("/post/user")
    public Post publishPostToProfile(@RequestBody CreatePostDto createPostDto,
                                     @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        System.out.println("hali");
        return this.postService.publishPostToProfile(createPostDto,token);
    }

}
