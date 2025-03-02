package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.auth.ViewPermissionCheckerService;
import com.auo.backend.dto.update.UpdateUserDto;
import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.PostResponse;
import com.auo.backend.responses.UserResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;
    private final AuthenticationService authenticationService;
    private final ViewPermissionCheckerService viewPermissionCheckerService;


    @Deprecated
    public List<UserResponse> getUsers() {
        return userRepository.findAll().stream().map(UserResponse::new).toList();
    }

    public UserResponse updateSelf(UpdateUserDto updateUserDto, String token) {
        User user = authenticationService.getUserFromToken(token);
        System.out.println(user);
        if (updateUserDto.getNickname() != null)
            user.setNickname(updateUserDto.getNickname());
        if (updateUserDto.getBio() != null)
            user.setBio(updateUserDto.getBio());
        if (updateUserDto.getDateOfBirth() != null)
            user.setDateOfBirth(updateUserDto.getDateOfBirth());
        if (updateUserDto.getProfileImg() != null)
            user.setProfileImg(updateUserDto.getProfileImg());
        userRepository.save(user);
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



    public UserResponse getUserById(Long userId) {
        return new UserResponse(findUserByIdOrThrow(userId));
    }

    @Transactional
    @Deprecated
    public void deleteUserById(Long userId) {
        userRepository.delete(findUserByIdOrThrow(userId));
    }

    public void flagSelfForDeletion(String token) {
        User user = authenticationService.getUserFromToken(token);
        user.setDeleted(true);
        userRepository.save(user);
    }


    @Deprecated
    public void updateUserById(Long userId, UpdateUserDto updateUserDto) {
        User user = findUserByIdOrThrow(userId);

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
        User user = findUserByIdOrThrow(userId);
        Optional<List<User>> followers = userRepository.findUsersByFollowingContains(user);
        return followers.map(users -> users.stream().map(UserResponse::new).toList()).orElse(null);

    }

    public List<UserResponse> getFollowingByUserId(Long userId) {
        User user = findUserByIdOrThrow(userId);
        return user.getFollowing().stream().map(UserResponse::new).toList();
    }

    public void removeFollowerFromSelf(String token, Long targetUserId) {
        User user = authenticationService.getUserFromToken(token);
        User target = findUserByIdOrThrow(targetUserId);
        if (!doesUserFollow(user, target)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "user_does_not_follow");
        }
        target.getFollowing().remove(user);
        userRepository.save(user);
    }

    public void unfollowUser(String token, Long targetUserId) {
        User user = authenticationService.getUserFromToken(token);
        User target = findUserByIdOrThrow(targetUserId);
        if (!doesUserFollow(user, target)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "user_does_not_follow");
        }
        user.getFollowing().remove(target);
        userRepository.save(user);
    }

    public void followUserById(String token, Long targetUserId) {
        User user = authenticationService.getUserFromToken(token);
            if (Objects.equals(user.getId(), targetUserId)) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "can_not_follow_self");
            }

        User target = findUserByIdOrThrow(targetUserId);
            if (doesUserFollow(user,  target)) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "already_followed");
            }
        user.getFollowing().add(target);
        userRepository.save(user);

    }

    public List<PostResponse> getPostsOfUser(String token, Long targetUserId) {
        User user = authenticationService.getUserFromToken(token);
        User targetUser = findUserByIdOrThrow(targetUserId);

        if (ViewPermissionCheckerService.isAbleToViewProfile(user, targetUser)) {
            if (targetUser.getPosts().isEmpty())
                return new ArrayList<>();
            return targetUser.getPosts().stream().map(post -> new PostResponse(post,user)).toList();
        }
        throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");
    }

    public User findUserByIdOrThrow(Long userId) {
        Optional<User> optionalUser = userRepository.findUserById(userId);
        if (optionalUser.isPresent()) return optionalUser.get();
        else throw new ResponseStatusException(HttpStatus.NOT_FOUND,"user_not_found");
    }

    public boolean doesUserFollow(User user, User target) {
        return user.getFollowing().contains(target);
    }


}
