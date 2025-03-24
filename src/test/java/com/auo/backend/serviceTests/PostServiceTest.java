package com.auo.backend.serviceTests;

import com.auo.backend.auth.GenericOwnershipCheckerService;
import com.auo.backend.dto.create.AddCommentDto;
import com.auo.backend.dto.create.CreatePostDto;
import com.auo.backend.dto.create.ImageDto;
import com.auo.backend.enums.PostType;
import com.auo.backend.models.*;
import com.auo.backend.repositories.*;
import com.auo.backend.responses.PostResponse;
import com.auo.backend.responses.UserResponse;
import com.auo.backend.services.GenericReactionService;
import com.auo.backend.services.PostService;
import com.auo.backend.services.UserService;
import com.auo.backend.utils.UserUtils;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.lenient;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class PostServiceTest {

    @Mock
    private PostRepository postRepository;
    @Mock
    private CommentRepository commentRepository;
    @Mock
    private CommentReplyRepository commentReplyRepository;
    @Mock
    private UserRepository userRepository;
    @Mock
    private VehicleRepository vehicleRepository;

    @Mock
    private UserUtils userUtils;

    @Mock
    private GenericOwnershipCheckerService<User, Post> postOwnershipCheckerService;
    @Mock
    private  GenericOwnershipCheckerService<User, Comment> commentOwnershipCheckerService;
    @Mock
    private  GenericOwnershipCheckerService<User, CommentReply> commentReplyOwnershipCheckerService;
    @Mock
    private GenericReactionService<Post> postReactionService;
    @Mock
    private  GenericReactionService<Comment> commentReactionService;
    @Mock
    private  GenericReactionService<CommentReply> commentReplyReactionService;
    @Mock
    private UserService userService;




    @InjectMocks
    private PostService postService;

    private User testUser;

    @BeforeEach
    void setup() {
        testUser = new User();
        testUser.setUsername("testUsername");
        testUser.setNickname("testNickname");
        testUser.setId(1L);
        testUser.setDeleted(false);
        testUser.setEmail("teszt@gmail.com");
        testUser.setFollowing(new ArrayList<>());
        testUser.setPosts(new ArrayList<>());
        testUser.setFavoritePosts(new ArrayList<>());


        lenient().when(postRepository.save(any())).thenAnswer(invocation -> {
            Post post = invocation.getArgument(0);
            post.setId(1L);
            return post;
        });
    }



    @Test
    void shouldReturnPostResponseOfCreatedPost_whenCreatingPostToProfile() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        ImageDto imageDto = new ImageDto();
        imageDto.setUrl("http://example.com/test.png");

        CreatePostDto createPostDto = new CreatePostDto();
        createPostDto.setText("Test Post");
        createPostDto.setLocation("Test Location");
        createPostDto.setPostImages(List.of(imageDto));



        var result = postService.publishPostToProfile(createPostDto);

        assertEquals(1L,result.getPostId());
        assertEquals(new UserResponse(testUser),result.getUser());
        assertEquals(imageDto.getUrl(),result.getImages().get(0).getUrl());
    }

    @Test
    void shouldReturnCommentResponse_whenCommentingOnPost() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        Post mockPost = Post.builder()
                .id(1L)
                .user(testUser)
                .comments(new ArrayList<>())
                .postType(PostType.USERPOST)
                .text("description")
                .images(List.of(new Image(1L, "tesztUrl",0,"deletehash")))
                .vehicle(null)
                .build();

        AddCommentDto dto = new AddCommentDto();
        dto.setText("testComment");

        lenient().when(postRepository.findPostById(1L)).thenReturn(Optional.of(mockPost));

        lenient().when(commentRepository.save(any())).thenAnswer(invocation-> {
            Comment comment = invocation.getArgument(0);
            comment.setId(1L);
            comment.setTime(LocalDateTime.now());
            return comment;
        });

        var result = postService.addCommentToPost(1L,dto);

        assertEquals(1L,result.getId());
        assertNotNull(result);
    }

    


}
