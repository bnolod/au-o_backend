package com.auo.backend.controllers;

import com.auo.backend.models.Post;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("api/v1/search")
public class SearchController {

    @GetMapping("/post/{text}")
    public List<Post> searchForPosts(@PathVariable String searchText) {
        return null;
    }
}
