package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.auth.GenericOwnershipCheckerService;
import com.auo.backend.dto.create.AddCommentDto;
import com.auo.backend.dto.create.CreatePostDto;
import com.auo.backend.dto.update.UpdatePostDto;
import com.auo.backend.enums.PostType;
import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.*;
import com.auo.backend.repositories.*;
import com.auo.backend.responses.*;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
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
    private final GenericOwnershipCheckerService<User, Post> postOwnershipCheckerService;
    private final GenericOwnershipCheckerService<User, Comment> commentOwnershipCheckerService;
    private final GenericOwnershipCheckerService<User, CommentReply> commentReplyOwnershipCheckerService;
    private final GenericReactionService<Post> postReactionService;
    private final GenericReactionService<Comment> commentReactionService;
    private final GenericReactionService<CommentReply> commentReplyReactionService;

    private final VehicleService vehicleService;
    private final CommentReplyRepository commentReplyRepository;


    public PostResponse publishPostToProfile(CreatePostDto createPostDto, String token) {
        User user = authenticationService.getUserFromToken(token);
        Vehicle vehicle = null;
        if (createPostDto.getVehicleId() != null) {
            vehicle = vehicleService.findOwnVehicleAndCheckOwnership(user, createPostDto.getVehicleId());
        }
        List<Image> imageList =
                createPostDto.getPostImages().stream().map(postImage -> {
                    return Image
                            .builder()
                            .index(createPostDto.getPostImages().indexOf(postImage))
                            .url(postImage.getUrl())
                            .deleteHash(postImage.getDeleteHash())
                            .build();
//            tempPost.getImages().add(tempImage);
                }).toList();

        Post tempPost = Post.builder()
                .postType(PostType.USERPOST)
                .text(createPostDto.getText())
                .user(user)
                .images(imageList)
                .location(createPostDto.getLocation())
                .vehicle(vehicle)
                .build();
        Post post = postRepository.save(tempPost);
        System.out.println("post.getImages() = " + post.getImages());

        return new PostResponse(post, user);

    }

    public PageResponse<PostResponse> getPostFeedOfUser(String token, int page, LocalDateTime time) {
        User user = authenticationService.getUserFromToken(token);

        Pageable pageable = PageRequest.of(page, 10);
        Page<Post> posts = postRepository.findPostsForUserFeed(pageable, user.getId(), time);
        System.out.println(posts);
        if (posts.isEmpty()) return null;
        System.out.println(PageResponse.of(posts.map(post -> new PostResponse(post, user))));
        return PageResponse.of(posts.map(post -> new PostResponse(post, user)));
    }

    public void publishPostToGroup() {
        //to be implemented
    }

    public List<PostResponse> getAllPosts(String token) {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Post> allPosts = this.postRepository.findAll(pageable);
        return allPosts.stream().map(post -> new PostResponse(post, authenticationService.getUserFromToken(token))).toList();
    }

    public PostResponse getPostById(Long postId, String token) {
        Optional<Post> post = postRepository.findPostById(postId);
        if (post.isPresent()) {
            return new PostResponse(post.get(), authenticationService.getUserFromToken(token));
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "post_not_found");
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
     */
    public void removeCommentFromPost(String token, Long commentId) {
        User user = authenticationService.getUserFromToken(token);
        Optional<Comment> optionalComment = commentRepository.findById(commentId);
        if (optionalComment.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "comment_not_found");
        }
        Comment comment = optionalComment.get();
        if (commentOwnershipCheckerService.isOwnerOf(user, comment)) {
            commentRepository.delete(comment);
        } else if (postOwnershipCheckerService.isOwnerOf(user, comment.getPost())) {
            commentRepository.delete(comment);
        } else throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");

    }


    public PostResponse updatePostOfUserById(Long postId, String token, UpdatePostDto updatePostDto) {
        User user = authenticationService.getUserFromToken(token);
        Post post = findPostByIdOrThrow(postId);

        if (postOwnershipCheckerService.isNotOwnerOf(user, post)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }

        if (updatePostDto.getText() != null) {
            post.setText(updatePostDto.getText());
            post.setDateOfUpdate(LocalDateTime.now());
        }
        if (updatePostDto.getLocation() != null) {
            post.setLocation(updatePostDto.getLocation());
            post.setDateOfUpdate(LocalDateTime.now());
        }
        if (updatePostDto.getVehicleId() != null) {
            post.setVehicle(vehicleService.findOwnVehicleAndCheckOwnership(user, updatePostDto.getVehicleId()));
            post.setDateOfUpdate(LocalDateTime.now());
        } else post.setVehicle(null);
        post = postRepository.save(post);

        return new PostResponse(post, user);
    }

    public PostResponse deletePostOfUserById(Long postId, String token) {
        User user = authenticationService.getUserFromToken(token);
        Post post = findPostByIdOrThrow(postId);
        if (postOwnershipCheckerService.isNotOwnerOf(user, post)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);

        }
        postRepository.delete(post);
        return new PostResponse(post, user);
    }

    public AddOrRemoveReactionResponse addOrRemoveReaction(Long postId, ReactionType reactionType, String token) {
        Post post = findPostByIdOrThrow(postId);
        String reactionMessage = postReactionService.addOrRemoveReactionToItem(post, reactionType, token);
        postRepository.save(post);
        return AddOrRemoveReactionResponse.builder()
                .message(reactionMessage)
                .reactionType(reactionType)
                .build();
    }

    public CommentReplyResponse replyToComment(Long commentId, String token, String text) {
        User user = authenticationService.getUserFromToken(token);
        Optional<Comment> optionalComment = commentRepository.findById(commentId);
        if (optionalComment.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "comment_not_found");
        }
        Comment parent = optionalComment.get();
        CommentReply reply = CommentReply.builder()
                .parent(parent)
                .user(user)
                .text(text)
                .build();

        commentReplyRepository.save(reply);

        return new CommentReplyResponse(reply, user);
    }

    public CommentReplyResponse deleteReplyFromComment(Long commentReplyId, String token) {
        User user = authenticationService.getUserFromToken(token);
        Optional<CommentReply> optionalCommentReply = commentReplyRepository.findById(commentReplyId);
        if (optionalCommentReply.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "reply_not_found");
        }

        if (commentReplyOwnershipCheckerService.isNotOwnerOf(user, optionalCommentReply.get())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "no_permission");
        }
        commentReplyRepository.delete(optionalCommentReply.get());
        return new CommentReplyResponse(optionalCommentReply.get(), user);
    }

    public AddOrRemoveReactionResponse addOrRemoveReactionToComment(Long commentId, ReactionType reactionType, String token) {
        Comment comment = findCommentByIdOrThrow(commentId);
        String reactionMessage = commentReactionService.addOrRemoveReactionToItem(comment, reactionType, token);
        commentRepository.save(comment);
        return AddOrRemoveReactionResponse.builder()
                .message(reactionMessage)
                .reactionType(reactionType)
                .build();
    }

    public AddOrRemoveReactionResponse addOrRemoveReactionToReply(Long replyId, ReactionType reactionType, String token) {
        CommentReply reply = findCommentReplyByIdOrThrow(replyId);
        String reactionMessage = commentReplyReactionService.addOrRemoveReactionToItem(reply, reactionType, token);
        commentReplyRepository.save(reply);
        return AddOrRemoveReactionResponse.builder()
                .message(reactionMessage)
                .reactionType(reactionType)
                .build();
    }


    public Post findPostByIdOrThrow(Long postId) {
        Optional<Post> optionalPost = postRepository.findPostById(postId);
        if (optionalPost.isEmpty())
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "post_not_found");
        return optionalPost.get();
    }

    public Comment findCommentByIdOrThrow(Long commentId) {
        Optional<Comment> optionalComment = commentRepository.findById(commentId);
        if (optionalComment.isEmpty()) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "comment_not_found");
        return optionalComment.get();
    }

    public CommentReply findCommentReplyByIdOrThrow(Long commentReplyId) {
        Optional<CommentReply> optionalCommentReply = commentReplyRepository.findById(commentReplyId);
        if (optionalCommentReply.isEmpty()) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "reply_not_found");
        return optionalCommentReply.get();
    }
}
