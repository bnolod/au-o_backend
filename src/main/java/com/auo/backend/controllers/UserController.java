package com.auo.backend.controllers;

import com.auo.backend.dto.update.UpdateUserDto;
import com.auo.backend.responses.PostResponse;
import com.auo.backend.responses.UserResponse;
import com.auo.backend.services.UserService;
import com.auo.backend.models.User;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping(path = "api/v1/users")
public class UserController {

    private final UserService userService;

//    @Autowired
//    public UserController(UserService userService) {
//        this.userService = userService;
//    };


//    Releasen ez semmilyen esetben nem lesz itt.
    @GetMapping("/all")
    public List<UserResponse> getUsers() {
        return userService.getUsers();
    }
//    Ne felejtsem el

    @GetMapping("/user/{userId}")
    public ResponseEntity<UserResponse> getUserById(@PathVariable Long userId) {
        return ResponseEntity.ok(userService.getUserById(userId));
    }


    @PostMapping("/user")
    public void createUser(@RequestBody User user) {
        userService.createUser(user);
    }

    @DeleteMapping("/user/{userId}")
    public void deleteUserById(@PathVariable Long userId) {
        userService.deleteUserById(userId);
    }

    @PutMapping("/user/update/{userId}")
    public void updateUserById(@PathVariable Long userId, @RequestBody UpdateUserDto updateUserDto) {
        userService.updateUserById(userId, updateUserDto);
    }

    @PutMapping("/user/update")
    public ResponseEntity<UserResponse> updateSelf(@RequestHeader(HttpHeaders.AUTHORIZATION) String token,@RequestBody UpdateUserDto updateUserDto ) {
        return ResponseEntity.ok(userService.updateSelf(updateUserDto,token));
    }

    @GetMapping("/user/{userId}/followers")
    public List<UserResponse> getFollowersByUserId(@PathVariable Long userId) {
        return userService.getFollowersByUserId(userId);
    }

    @GetMapping("/user/{userId}/following")
    public ResponseEntity<List<UserResponse>> getFollowingByUserId(@PathVariable Long userId) {
        return ResponseEntity.ok(userService.getFollowingByUserId(userId));
    }

    @PostMapping("/user/{userId}/follow")
    public void followUserById(@PathVariable Long userId,
        @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        userService.followUserById(token, userId);
    }

    @DeleteMapping("user/{userId}/unfollow")
    public void unfollowUser(@PathVariable Long userId,
                                 @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        userService.unfollowUser(token,userId);
    }

    @DeleteMapping("user/{userId}/remove_follower")
    public void removeFollowerFromSelf(@PathVariable Long userId,
                                        @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        userService.removeFollowerFromSelf(token,userId);
    }

    @GetMapping("user/{userId}/posts")
    public ResponseEntity<List<PostResponse>> getPostsOfUser(@PathVariable Long userId,
                                                             @RequestHeader(HttpHeaders.AUTHORIZATION) String token) {
        return ResponseEntity.ok(userService.getPostsOfUser(token,userId));
    }

}
