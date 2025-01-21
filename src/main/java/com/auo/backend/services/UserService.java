package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.dto.UpdateUserDto;
import com.auo.backend.models.User;
import com.auo.backend.models.UserConnection;
import com.auo.backend.repositories.UserConnectionRepository;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.UserResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.NativeQuery;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicReference;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;
    private final UserConnectionRepository userConnectionRepository;
    private final AuthenticationService authenticationService;


    public List<User> getUsers() {
        return userRepository.findAll();
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
        if (!optionalUser.isPresent()) {
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


    public ArrayList<UserResponse> getFollowersByUserId(Long userId) {
        Optional<ArrayList<UserConnection>> userConnectionArrayList = userConnectionRepository.findUserConnectionsByFollowingUserId(userId);
        if (userConnectionArrayList.isEmpty()) {
            return null;
        }
        AtomicReference<User> temp = new AtomicReference<>();
        ArrayList<UserResponse> responseArrayList = new ArrayList<>();
        userConnectionArrayList.get().forEach( connection ->
        {
            temp.set(getUserById(connection.getUserId()));
            responseArrayList.add(
                    UserResponse
                            .builder()
                            .id(temp.get().getId())
                            .username(temp.get().getUsername())
                            .nickname(temp.get().getNickname())
                            .build()
            );
        });
        return responseArrayList;
    }

    public ArrayList<UserResponse> getFollowingByUserId(Long userId) {
        Optional<ArrayList<UserConnection>> userConnectionArrayList = userConnectionRepository.findUserConnectionsByUserId(userId);
        if (userConnectionArrayList.isEmpty()) {
            return null;
        }
        AtomicReference<User> temp = new AtomicReference<>();
        ArrayList<UserResponse> responseArrayList = new ArrayList<>();
        userConnectionArrayList.get().forEach( connection ->
        {
            temp.set(getUserById(connection.getFollowingUserId()));
            responseArrayList.add(
                    UserResponse
                            .builder()
                            .id(temp.get().getId())
                            .username(temp.get().getUsername())
                            .nickname(temp.get().getNickname())
                            .build()
            );
        });
        return responseArrayList;
    }

    public void followUserById(String token, Long userId) {
        User user = authenticationService.getUserFromToken(token);
        if (Objects.equals(user.getId(), userId)) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "can_not_follow_self");
        }
        if (userRepository.findUserById(userId).isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "user_not_found");
        }
        try {
            UserConnection userConnection = UserConnection
                    .builder()
                    .userId(user.getId())
                    .followingUserId(userId)
                    .build();
            userConnectionRepository.save(userConnection);

        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "follow_failed");
        }
    }

}
