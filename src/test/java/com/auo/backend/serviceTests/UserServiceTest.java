package com.auo.backend.serviceTests;

import com.auo.backend.auth.ViewPermissionCheckerService;
import com.auo.backend.dto.update.UpdateUserDto;
import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.UserResponse;
import com.auo.backend.services.UserService;
import com.auo.backend.utils.UserUtils;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockedStatic;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private UserUtils userUtils;



    @InjectMocks
    private UserService userService;

    private User testUser;
    private User secondaryTestUser;

    MockedStatic<ViewPermissionCheckerService> mockedStatic;

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

        secondaryTestUser = new User();
        secondaryTestUser.setUsername("testUsername2");
        secondaryTestUser.setNickname("testNickname2");
        secondaryTestUser.setId(2L);
        secondaryTestUser.setDeleted(false);
        secondaryTestUser.setEmail("teszt2@gmail.com");
        secondaryTestUser.setFollowing(new ArrayList<>());
        secondaryTestUser.setPosts(new ArrayList<>());

        mockedStatic = mockStatic(ViewPermissionCheckerService.class);
        mockedStatic.when(()-> ViewPermissionCheckerService.isAbleToViewProfile(any(),any())).thenReturn(true);

    }

    @AfterEach
    public void teardown() {
        mockedStatic.close();
    }


    @Test
    void shouldReturnUpdatedUser_whenUserIsEdited() {
        UpdateUserDto dto = new UpdateUserDto();
        dto.setBio("editedBio");

        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        lenient().when(userRepository.findUserById(1L)).thenReturn(Optional.of(testUser));
        when(userRepository.save(any(User.class))).thenReturn(testUser);

        UserResponse result = userService.updateSelf(dto);

        assertEquals(UserResponse.class, result.getClass());
        assertEquals("editedBio", testUser.getBio());
        assertEquals("editedBio", result.getBio());
    }

    @Test
    void shouldReturnUserResponse_whenGettingExistingUserById() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        lenient().when(userRepository.findUserById(1L)).thenReturn(Optional.of(testUser));

        UserResponse result = userService.getUserById(1L);
        assertEquals(new UserResponse(testUser),result);
    }

    @Test
    void shouldThrowException_whenGettingNotExistingUserById() {
        lenient().when(userRepository.findUserById(5L)).thenReturn(Optional.empty());
        ResponseStatusException exception = assertThrows(ResponseStatusException.class,
                ()-> userService.getUserById(5L));

        assertEquals(HttpStatus.NOT_FOUND,exception.getStatusCode());
    }

    @Test
    void shouldFlagUserDeleted_whenDeletingUser() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        userService.flagSelfForDeletion();
        assertTrue(testUser.isDeleted());
    }

    @Test
    void shouldReturnNull_whenFollowersEmpty() {
        lenient().when(userRepository.findUserById(1L)).thenReturn(Optional.of(testUser));
        assertNull(userService.getFollowersByUserId(testUser.getId()));
    }

    @Test
    void shouldReturnFollowers_whenFollowersNotEmpty() {
        secondaryTestUser.getFollowing().add(testUser);
        lenient().when(userRepository.findUserById(1L)).thenReturn(Optional.of(testUser));
        lenient().when(userRepository.findUsersByFollowingContains(testUser))
                .thenReturn(Optional.of(List.of(secondaryTestUser)));

        var result = userService.getFollowersByUserId(testUser.getId());
        assertEquals(new UserResponse(secondaryTestUser),result.get(0));
    }


    @Test
    void shouldReturnEmptyArray_whenFollowingEmpty() {
        lenient().when(userRepository.findUserById(1L)).thenReturn(Optional.of(testUser));

        assertEquals(new ArrayList<>(),userService.getFollowingByUserId(testUser.getId()));
    }

    @Test
    void shouldReturnFollowing_whenFollowingNotEmpty() {
        testUser.getFollowing().add(secondaryTestUser);
        lenient().when(userRepository.findUserById(1L)).thenReturn(Optional.of(testUser));
        lenient().when(userRepository.findUsersByFollowingContains(testUser))
                .thenReturn(Optional.of(List.of(secondaryTestUser)));

        var result = userService.getFollowingByUserId(testUser.getId());

        assertEquals(new UserResponse(secondaryTestUser),result.get(0));
    }

    @Test
    void shouldThrowException_whenRemovingFollowerFromSelf() {
        lenient().when(userRepository.findUserById(1L)).thenReturn(Optional.of(testUser));
        when(userUtils.getCurrentUser()).thenReturn(testUser);

        ResponseStatusException exception = assertThrows(ResponseStatusException.class,
                () -> userService.removeFollowerFromSelf(1L));

        assertEquals(HttpStatus.BAD_REQUEST, exception.getStatusCode());
    }

    @Test
    void shouldThrowException_whenUnfollowingNotFollowedUser() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        lenient().when(userRepository.findUserById(1L)).thenReturn(Optional.of(testUser));

        ResponseStatusException exception = assertThrows(ResponseStatusException.class,
                () -> userService.unfollowUser(1L));

        assertEquals(HttpStatus.BAD_REQUEST,exception.getStatusCode());
    }

    @Test
    void shouldThrowException_whenFollowingSelf() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        lenient().when(userRepository.findUserById(1L)).thenReturn(Optional.of(testUser));

        ResponseStatusException exception = assertThrows(ResponseStatusException.class,
                () -> userService.followUserById(1L));

        assertEquals(HttpStatus.CONFLICT, exception.getStatusCode());
    }

    @Test
    void shouldReturnEmptyPosts_whenGettingPostsOfUserWithNoPosts() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        lenient().when(userRepository.findUserById(2L)).thenReturn(Optional.of(secondaryTestUser));

        var result = userService.getPostsOfUser(2L);

        assertEquals(new ArrayList<>(), result);

    }

}
