package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.auth.ViewPermissionCheckerService;
import com.auo.backend.dto.UpdateUserDto;
import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.PostResponse;
import com.auo.backend.responses.UserResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;
    private final AuthenticationService authenticationService;
    private final ViewPermissionCheckerService viewPermissionCheckerService;


    public List<UserResponse> getUsers() {
        return userRepository.findAll().stream().map(UserResponse::new).toList();
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
        if (updateUserDto.getDateOfBirth() != null) {
            user.setDateOfBirth(updateUserDto.getDateOfBirth());
        }
        if (updateUserDto.getProfileImg() != null) {
            user.setProfileImg(updateUserDto.getProfileImg());
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

    public User getUserByIdOrThrow(Long userId) {
        Optional<User> optionalUser = userRepository.findUserById(userId);
        if (optionalUser.isPresent()) return optionalUser.get();
        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "user_not_found");
    }

    public UserResponse getUserById(Long userId) {
        Optional<User> user = userRepository.findById(userId);
        if (user.isPresent()) {
            return new UserResponse(user.get());
        }
        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "user_not_found");
//        return new UserResponse(user.isPresent() ? user.get() : ).orElse(null);
    }

    @Transactional
    public void deleteUserById(Long userId) {
        if (!userRepository.existsById(userId)) {
            throw new IllegalStateException("User with id " + userId + " does not exist");
        }
        userRepository.deleteById(userId);
    }

    public void flagSelfForDeletion(String token) {
        User user = authenticationService.getUserFromToken(token);
        user.setDeleted(true);
        userRepository.save(user);
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

        if (updateUserDto.getDateOfBirth() != null) {
            user.setDateOfBirth(updateUserDto.getDateOfBirth());
        }

        userRepository.save(user);

    }


    public List<UserResponse> getFollowersByUserId(Long userId) {
        Optional<User> optionalUser = userRepository.findUserById(userId);
        if (optionalUser.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "user_not_fouond");
        }
        Optional<List<User>> followers = userRepository.findUsersByFollowingContains(optionalUser.get());
        return followers.map(users -> users.stream().map(UserResponse::new).toList()).orElse(null);

    }

    public List<UserResponse> getFollowingByUserId(Long userId) {
        Optional<User> optionalUser = userRepository.findUserById(userId);
        return optionalUser.map(user -> user.getFollowing().stream().map(UserResponse::new).toList()).orElse(null);
    }

    public void removeFollowerFromSelf(String token, Long userFollowerId) {
        User user = authenticationService.getUserFromToken(token);
        Optional<User> optionalFollowerUser = userRepository.findUserById(userFollowerId);
        if (optionalFollowerUser.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "user_not_found");
        }
        if (!optionalFollowerUser.get().getFollowing().contains(user)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "user_does_not_follow");
        }
        optionalFollowerUser.get().getFollowing().remove(user);
        userRepository.save(user);
    }

    public void unfollowUser(String token, Long followedUserId) {
        User user = authenticationService.getUserFromToken(token);
        Optional<User> optionalFollowedUser = userRepository.findUserById(followedUserId);
        if (optionalFollowedUser.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "user_not_found");
        }
        if (!user.getFollowing().contains(optionalFollowedUser.get())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "user_does_not_follow");
        }
        user.getFollowing().remove(optionalFollowedUser.get());
        userRepository.save(user);
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

    }

    public List<PostResponse> getPostsOfUser(String token, Long targetUserId) {
        User user = authenticationService.getUserFromToken(token);
        Optional<User> optionalTargetUser = userRepository.findUserById(targetUserId);
        if (optionalTargetUser.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "user_not_found");
        }
        User targetUser = optionalTargetUser.get();
        if (viewPermissionCheckerService.isAbleToViewProfile(user, targetUser)) {
            if (targetUser.getPosts().isEmpty())
                return null;
            return targetUser.getPosts().stream().map(PostResponse::new).toList();
        }
        throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");

    }



}
