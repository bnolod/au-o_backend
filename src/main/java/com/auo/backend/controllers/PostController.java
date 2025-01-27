package com.auo.backend.controllers;


import com.auo.backend.repositories.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class PostController {
    private final PostRepository postRepository;

    public void createUserPost() {

    }

}
