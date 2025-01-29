package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.dto.CreatePostDto;
import com.auo.backend.enums.PostType;
import com.auo.backend.models.Post;
import com.auo.backend.models.PostImages;
import com.auo.backend.models.User;
import com.auo.backend.repositories.PostImageRepository;
import com.auo.backend.repositories.PostRepository;
//import com.auo.backend.repositories.UserPostRepository;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.PostResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Service
public class PostService {
    private final PostRepository postRepository;
    private final UserRepository userRepository;
    private final AuthenticationService authenticationService;
    private final PostImageRepository postImageRepository;

    public PostResponse publishPostToProfile(CreatePostDto createPostDto, String token) {
        User user = authenticationService.getUserFromToken(token);

        Post tempPost = Post.builder()
            .postType(PostType.USERPOST)
            .text(createPostDto.getText())
            .user(user)
            .location(createPostDto.getLocation())
            .build();
        postRepository.save(tempPost);

        createPostDto.getPostImages().forEach(postImage -> {
            PostImages tempImage = PostImages
                    .builder()
                    .index(createPostDto.getPostImages().indexOf(postImage))
                    .url(postImage.getUrl())
                    .deleteHash(postImage.getDeleteHash())
                    .post(tempPost)
                    .build();
            tempPost.getImages().add(tempImage);
            postImageRepository.save(tempImage);
        });
//
        postRepository.save(tempPost);
        return new PostResponse(tempPost);

    }

    public void publishPostToGroup() {
    //to be implemented
    }

    public List<PostResponse> getAllPosts() {
        List<PostResponse> postResponseList = new ArrayList<>();
        List<Post> allPosts = this.postRepository.findAll();
        allPosts.forEach(post -> {
            postResponseList.add(new PostResponse(post));
        });

        return postResponseList;
    }


}
