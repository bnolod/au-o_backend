package com.auo.backend.controllers;

import com.auo.backend.services.UserService;
import com.auo.backend.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/users")
public class UserController {

    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    };

//    Releasen ez semmilyen esetben nem lesz itt.
    @GetMapping("/all")
    public List<User> getUsers() {
        return userService.getUsers();
    }
//    Ne felejtsem el

    @GetMapping("/user/{userId}")
    public User getUserById(@PathVariable Long userId) {
        return userService.getUserById(userId);
    }


    @PostMapping("/user")
    public void createUser(@RequestBody User user) {
        userService.createUser(user);
    }

    @DeleteMapping("/user/{userId}")
    public void deleteUserById(@PathVariable Long userId) {
        userService.deleteUserById(userId);
    }

}
