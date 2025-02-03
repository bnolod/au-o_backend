package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.auth.OwnershipCheckerService;
import com.auo.backend.dto.AddCommentDto;
import com.auo.backend.dto.CreatePostDto;
import com.auo.backend.dto.UpdatePostDto;
import com.auo.backend.enums.PostType;
import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.*;
import com.auo.backend.repositories.CommentRepository;
import com.auo.backend.repositories.PostImageRepository;
import com.auo.backend.repositories.PostRepository;
//import com.auo.backend.repositories.UserPostRepository;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.AddOrRemoveReactionResponse;
import com.auo.backend.responses.CommentResponse;
import com.auo.backend.responses.PostResponse;
import com.auo.backend.responses.UserResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDateTime;
import java.util.*;

@RequiredArgsConstructor
@Service
public class PostService {
    private final PostRepository postRepository;
    private final UserRepository userRepository;
    private final AuthenticationService authenticationService;
    private final PostImageRepository postImageRepository;
    private final CommentRepository commentRepository;
    private final OwnershipCheckerService<User,Post> postOwnershipCheckerService;
    private final OwnershipCheckerService<User,Comment> commentOwnershipCheckerService;
    private final GenericReactionService<Post> postReactionService;


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
        Pageable pageable = PageRequest.of(0, 10);
        Page<Post> allPosts = this.postRepository.findAll(pageable);
        return allPosts.stream().map(PostResponse::new).toList();
    }

    public PostResponse getPostById(Long postId) {
        Optional<Post> post = postRepository.findPostById(postId);
        if (post.isPresent()) {
            return new PostResponse(post.get());
        }else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }


    public CommentResponse addCommentToPost(String token, Long postId, AddCommentDto commentText) {
        User user = authenticationService.getUserFromToken(token);

        Optional<Post> optionalPost = postRepository.findPostById(postId);
            if (optionalPost.isEmpty()) {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND);
            }
        Post post = optionalPost.get();

        Comment tempComment = Comment.builder()
                .text(commentText.getText())
                .user(user)
                .post(post)
                .build();

        commentRepository.save(tempComment);
        return CommentResponse.builder()
                .id(tempComment.getId())
                .text(commentText.getText())
                .user(new UserResponse(user))
                .time(tempComment.getTime())
                .build();
    }

    /**
     * Úgy terveztem ezt a szart hogy a saját kommentet, vagy a saját posztod alatti összes kommentet ki tudd törölni
     * talán működik, talán nem, majd teszt hétfőn
     *
     *
     */
    public void removeCommentFromPost(String token, Long commentId) {
        User user = authenticationService.getUserFromToken(token);
        Optional<Comment> optionalComment = commentRepository.findById(commentId);
        if (optionalComment.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "comment_not_found");
        }
        Comment comment = optionalComment.get();
        if (commentOwnershipCheckerService.isOwnerOf(user,comment)) {
            commentRepository.delete(comment);
        } else if (postOwnershipCheckerService.isOwnerOf(user,comment.getPost())) {
            commentRepository.delete(comment);
        } else throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");

    }


    public PostResponse updatePostOfUserById(Long postId, String token, UpdatePostDto updatePostDto) {
        User user = authenticationService.getUserFromToken(token);
        Optional<Post> optionalPost = postRepository.findPostById(postId);
        if (optionalPost.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }

        Post post = optionalPost.get();

        if (postOwnershipCheckerService.isNotOwnerOf(user, post)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }

        if (!updatePostDto.getText().isEmpty()) {
            post.setText(updatePostDto.getText());
            post.setDateOfUpdate(LocalDateTime.now());
        }
        if (!updatePostDto.getLocation().isEmpty()) {
            post.setLocation(updatePostDto.getLocation());
            post.setDateOfUpdate(LocalDateTime.now());
        }

        postRepository.save(post);

        return new PostResponse(post);
    }

    public PostResponse deletePostOfUserById(Long postId, String token) {
        User user = authenticationService.getUserFromToken(token);
        Optional<Post> optionalPost = postRepository.findPostById(postId);
        if (optionalPost.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        Post post = optionalPost.get();
        if (postOwnershipCheckerService.isNotOwnerOf(user, post)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);

        }
        postRepository.delete(post);
        return new PostResponse(post);
    }

    public AddOrRemoveReactionResponse addOrRemoveReaction(Long postId, ReactionType reactionType, String token) {
        Optional<Post> optionalPost = postRepository.findPostById(postId);
        if (optionalPost.isEmpty())
            throw new ResponseStatusException(HttpStatus.NOT_FOUND,"post_not_found");
        Post post = optionalPost.get();
        String reactionMessage = postReactionService.addOrRemoveReactionToItem(post,reactionType,token);

        postRepository.save(post);
        return AddOrRemoveReactionResponse.builder()
                .message(reactionMessage)
                .reactionType(reactionType)
                .build();
    }
}
