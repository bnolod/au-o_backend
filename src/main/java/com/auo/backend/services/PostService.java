package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.dto.CreatePostDto;
import com.auo.backend.dto.UpdatePostDto;
import com.auo.backend.enums.PostType;
import com.auo.backend.models.Comment;
import com.auo.backend.models.Post;
import com.auo.backend.models.Image;
import com.auo.backend.models.User;
import com.auo.backend.repositories.CommentRepository;
import com.auo.backend.repositories.PostImageRepository;
import com.auo.backend.repositories.PostRepository;
//import com.auo.backend.repositories.UserPostRepository;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.PostResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.*;

@RequiredArgsConstructor
@Service
public class PostService {
    private final PostRepository postRepository;
    private final UserRepository userRepository;
    private final AuthenticationService authenticationService;
    private final PostImageRepository postImageRepository;
    private final CommentRepository commentRepository;


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
            Image tempImage = Image
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

    public PostResponse getPostById(Long postId) {
        Optional<Post> post = postRepository.findPostById(postId);
        if (post.isPresent()) {
            return new PostResponse(post.get());
        }else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }


    public void addCommentToPost(String commentText, String token, Long postId) {
        User user = authenticationService.getUserFromToken(token);

        Optional<Post> optionalPost = postRepository.findPostById(postId);
            if (optionalPost.isEmpty()) {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND);
            }
        Post post = optionalPost.get();

        Comment tempComment = Comment.builder()
                .text(commentText)
                .user(user)
                .post(post)
                .build();

        commentRepository.save(tempComment);
//        post.getComments().add(tempComment);
//        postRepository.save(post);

    }


    public PostResponse updatePostOfUserById(Long postId, String token, UpdatePostDto updatePostDto) {
        User user = authenticationService.getUserFromToken(token);
        Optional<Post> optionalPost = postRepository.findPostById(postId);
        if (optionalPost.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }

        Post post = optionalPost.get();

        if (!Objects.equals(post.getUser().getId(), user.getId())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }

        if (!updatePostDto.getText().isEmpty()) {
            post.setText(updatePostDto.getText());
        }
        if (!updatePostDto.getLocation().isEmpty()) {
            post.setLocation(updatePostDto.getLocation());
        }
        postRepository.save(post);

        return new PostResponse(post);
    }
}
