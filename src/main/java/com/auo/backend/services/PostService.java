package com.auo.backend.services;

import com.auo.backend.auth.GenericOwnershipCheckerService;
import com.auo.backend.auth.ViewPermissionCheckerService;
import com.auo.backend.configs.RateLimitProtection;
import com.auo.backend.dto.create.AddCommentDto;
import com.auo.backend.dto.create.CreatePostDto;
import com.auo.backend.dto.update.UpdatePostDto;
import com.auo.backend.enums.PostType;
import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.*;
import com.auo.backend.repositories.*;
import com.auo.backend.responses.*;
import com.auo.backend.utils.UserUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class PostService {
    private final PostRepository postRepository;
    private final CommentRepository commentRepository;
    private final GenericOwnershipCheckerService<User, Post> postOwnershipCheckerService;
    private final GenericOwnershipCheckerService<User, Comment> commentOwnershipCheckerService;
    private final GenericOwnershipCheckerService<User, CommentReply> commentReplyOwnershipCheckerService;
    private final GenericReactionService<Post> postReactionService;
    private final GenericReactionService<Comment> commentReactionService;
    private final GenericReactionService<CommentReply> commentReplyReactionService;
    private final UserUtils userUtils;
    private final VehicleService vehicleService;
    private final CommentReplyRepository commentReplyRepository;
    private final UserRepository userRepository;
    private final VehicleRepository vehicleRepository;
    private final ViewPermissionCheckerService viewPermissionCheckerService;
    private final FavoritePostRepository favoritePostRepository;
    private final UserService userService;


    public PostResponse publishPostToProfile(CreatePostDto createPostDto) {
        User user = userUtils.getCurrentUser();
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

        return new PostResponse(post, user);

    }

    public PageResponse<PostResponse> getPostFeedOfUser(int page, LocalDateTime time) {
        User user = userUtils.getCurrentUser();
        Pageable pageable = PageRequest.of(page, 10);
        Page<Post> posts = postRepository.findPostsForUserFeed(pageable, user.getId(), time);
//        if (posts.isEmpty()) return null;
        return PageResponse.of(posts.map(post -> new PostResponse(post, user)));
    }

    public List<PostResponse> getPostsByVehicleId(Long vehicleId) {
        User user = userUtils.getCurrentUser();
        Vehicle vehicle = vehicleRepository.findById(vehicleId).orElseThrow();
        if (!vehicle.getUser().isPublic() && !user.getFollowing().contains(vehicle.getUser())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "can not view post");
        }
        List<Post> posts = postRepository.getPostsByVehicle_Id(vehicleId);
        posts.stream().filter(post -> {
            if (post.getGroupMember() != null) {
                if (!user.getGroups().stream().anyMatch(groupMember -> groupMember.getGroup() == post.getGroupMember().getGroup())) {
                    return false;
                }
            }
            return true;
        });
        return posts.stream().map(post -> new PostResponse(post, user)).collect(Collectors.toList());
    }

    @Deprecated
    public List<PostResponse> getAllPosts() {
        List<Post> allPosts = this.postRepository.findAll();
        User user = userUtils.getCurrentUser();
        return allPosts.stream().map(post -> new PostResponse(post, user)).toList();
    }

    public PostResponse getPostById(Long postId) {
        Optional<Post> post = postRepository.findPostById(postId);
        if (post.isPresent()) {
            return new PostResponse(post.get(), userUtils.getCurrentUser());
        } else {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "post_not_found");
        }
    }


    public CommentResponse addCommentToPost( Long postId, AddCommentDto commentText) {
        User user = userUtils.getCurrentUser();

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
    public void removeCommentFromPost( Long commentId) {
        User user = userUtils.getCurrentUser();
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



    @Transactional
    public PostResponse updatePostOfUserById(Long postId, UpdatePostDto updatePostDto) {
        User user = userUtils.getCurrentUser();
        Post post = findPostByIdOrThrow(postId);


        if (post.getPostType() == PostType.USERPOST) {
            if (postOwnershipCheckerService.isNotOwnerOf(user, post)) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
            }
        } else {
            if (!post.getGroupMember().getUser().equals(user)) {
                throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
            }
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

    @Transactional
    public PostResponse deletePostOfUserById(Long postId) {
        User user = userUtils.getCurrentUser();
        Post post = findPostByIdOrThrow(postId);
        if (post.getPostType() == PostType.USERPOST) {
            if (postOwnershipCheckerService.isNotOwnerOf(user, post)) {
                throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
            }
        } else {
            if (!post.getGroupMember().getUser().equals(user)) {
                throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
            }
        }

        postRepository.delete(post);
        return new PostResponse(post, user);
    }

    @Transactional
    @RateLimitProtection
    public AddOrRemoveReactionResponse addOrRemoveReaction(Long postId, ReactionType reactionType) {
        Post post = findPostByIdOrThrow(postId);
        String reactionMessage = postReactionService.addOrRemoveReactionToItem(post, reactionType);
        postRepository.save(post);
        return AddOrRemoveReactionResponse.builder()
                .message(reactionMessage)
                .reactionType(reactionType)
                .build();
    }

    @Transactional
    public CommentReplyResponse replyToComment(Long commentId, String text) {
        User user = userUtils.getCurrentUser();
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

    @Transactional
    public CommentReplyResponse deleteReplyFromComment(Long commentReplyId) {
        User user = userUtils.getCurrentUser();
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

    @Transactional
    @RateLimitProtection
    public AddOrRemoveReactionResponse addOrRemoveReactionToComment(Long commentId, ReactionType reactionType) {
        Comment comment = findCommentByIdOrThrow(commentId);
        String reactionMessage = commentReactionService.addOrRemoveReactionToItem(comment, reactionType);
        commentRepository.save(comment);
        return AddOrRemoveReactionResponse.builder()
                .message(reactionMessage)
                .reactionType(reactionType)
                .build();
    }

    @RateLimitProtection
    @Transactional
    public AddOrRemoveReactionResponse addOrRemoveReactionToReply(Long replyId, ReactionType reactionType) {
        CommentReply reply = findCommentReplyByIdOrThrow(replyId);
        String reactionMessage = commentReplyReactionService.addOrRemoveReactionToItem(reply, reactionType);
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

    public String favoritePost(Long postId) {
        User user = userUtils.getCurrentUser();
        Post post = findPostByIdOrThrow(postId);
        Optional<FavoritePost> optional = favoritePostRepository.getFavoritePostByUserAndPost(user,post);
        if (optional.isPresent()) {
            favoritePostRepository.delete(optional.get());
            return "removed";
        }
        if (ViewPermissionCheckerService.isAbleToViewPost(user,post)) {
            FavoritePost favoritePost = FavoritePost.builder()
                    .post(post)
                    .user(user)
                    .build();
            user.getFavoritePosts().add(favoritePost);
            userRepository.save(user);
            return "added";
        } else {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");
        }
    }

    public List<PostResponse> getFavoritePostOfUserById(Long userId) {
        User currUser = userUtils.getCurrentUser();
        User targetUser = userService.findUserByIdOrThrow(userId);
        if (ViewPermissionCheckerService.isAbleToViewProfile(currUser,targetUser)) {
            return favoritePostRepository.getFavoritePostByUser(targetUser).stream()
                    .map(favoritePost -> new PostResponse(favoritePost.getPost(),currUser)).toList();
        } else {
            return null;
        }
    }
}
