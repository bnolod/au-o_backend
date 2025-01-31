package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.dto.UpdateUserDto;
import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.UserResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;
    private final AuthenticationService authenticationService;


    public List<User> getUsers() {
        return userRepository.findAll();
    }

    public UserResponse updateSelf(UpdateUserDto updateUserDto, String token) {
        User user = authenticationService.getUserFromToken(token);
        System.out.println(user);
        if (updateUserDto.getNickname() != null) {
            user.setNickname(updateUserDto.getNickname());
        }
        if (updateUserDto.getBio() != null) {
            user.setBio(updateUserDto.getBio());
        }
        if (updateUserDto.getDate_of_birth() != null) {
            user.setDateOfBirth(updateUserDto.getDate_of_birth());
        }
        if (updateUserDto.getProfile_img() != null) {
            user.setProfileImg(updateUserDto.getProfile_img());
        }
        userRepository.save(user);
        System.out.println(updateUserDto);
        System.out.println(user);
        return new UserResponse(user);

    }

    public void createUser(User user) {
        Optional<User> userByEmail = userRepository.findUserByEmail(user.getEmail());
        if (userByEmail.isPresent()) {
            throw new IllegalStateException("Email taken");
        }
        Optional<User> userByUsername = userRepository.findUserByUsername(user.getUsername());
        if (userByUsername.isPresent()) {
            throw new IllegalStateException("Username taken");
        }
        userRepository.save(user);
    }

    public User getUserById(Long userId) {
        Optional<User> user = userRepository.findById(userId);
        return user.orElse(null);
    }

    public void deleteUserById(Long userId) {
        if (!userRepository.existsById(userId)) {
            throw new IllegalStateException("User with id " + userId + " does not exist");
        }
        userRepository.deleteById(userId);
    }

    public void updateUserById(Long userId, UpdateUserDto updateUserDto) {
        Optional<User> optionalUser = userRepository.findById(userId);
        if (optionalUser.isEmpty()) {
            throw new IllegalStateException("User with id " + userId + " does not exist");
        }
        User user = optionalUser.get();

        if (updateUserDto.getNickname() != null) {
            user.setNickname(updateUserDto.getNickname());
        }

        if (updateUserDto.getBio() != null) {
            user.setBio(updateUserDto.getBio());
        }

        if (updateUserDto.getDate_of_birth() != null) {
            user.setDateOfBirth(updateUserDto.getDate_of_birth());
        }

        userRepository.save(user);

    }


    public List<UserResponse> getFollowersByUserId(Long userId) {
        Optional<User> optionalUser = userRepository.findUserById(userId);
        return optionalUser.map(user -> user.getFollowers().stream().map(UserResponse::new).toList()).orElse(null);

    }

    public List<UserResponse> getFollowingByUserId(Long userId) {
        Optional<User> optionalUser = userRepository.findUserById(userId);
        return optionalUser.map(user -> user.getFollowing().stream().map(UserResponse::new).toList()).orElse(null);
    }

    public void followUserById(String token, Long userId) {
        User user = authenticationService.getUserFromToken(token);
            if (Objects.equals(user.getId(), userId)) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "can_not_follow_self");
            }
        Optional<User> optionalUserToFollow = userRepository.findUserById(userId);
            if (optionalUserToFollow.isEmpty()) {
                throw new ResponseStatusException(HttpStatus.NOT_FOUND, "user_not_found");
            }
        User userToFollow = optionalUserToFollow.get();
            if (user.getFollowing().contains(userToFollow)) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "already_followed");
            }
        user.getFollowing().add(userToFollow);
        userRepository.save(user);

        userToFollow.getFollowers().add(user);
        userRepository.save(userToFollow);
    }



}
