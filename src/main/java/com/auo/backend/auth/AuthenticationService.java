package com.auo.backend.auth;

import com.auo.backend.dto.UserLoginDto;
import com.auo.backend.dto.UserRegisterDto;
import com.auo.backend.enums.UserRole;
import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.UserResponse;
import com.auo.backend.validationServices.UserValidationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.server.ResponseStatusException;

import java.util.Optional;


@Service
@RequiredArgsConstructor
public class AuthenticationService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final UserValidationService userValidationService;

    public AuthenticationResponse register(UserRegisterDto userRegisterDto) {
        if (!userValidationService.IsEmailValid(userRegisterDto.getEmail())) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "invalid_email_format");
        }

        var user = User.builder()
                .username(userRegisterDto.getUsername())
                .password(passwordEncoder.encode(userRegisterDto.getPassword()))
                .email(userRegisterDto.getEmail())
                .role(UserRole.USER)
                .dateOfBirth(userRegisterDto.getDate_of_birth())
                .nickname(userRegisterDto.getNickname())
                .isPublic(true)
                .build();
        userRepository.save(user);
        var jwtToken = jwtService.generateToken(user);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }

    public AuthenticationResponse login(UserLoginDto userLoginDto) {
        Optional<User> optionalUser;
        if (userLoginDto.getUsernameOrEmail().contains("@")) {
            optionalUser = userRepository.findUserByEmail(userLoginDto.getUsernameOrEmail());
        }else {
            optionalUser = userRepository.findUserByUsername(userLoginDto.getUsernameOrEmail());
        }
        if (optionalUser.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }

        User user = optionalUser.get();

        if (!passwordEncoder.matches(userLoginDto.getPassword(), user.getPassword())) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }

        var jwtToken = jwtService.generateToken(user);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }

    public AuthenticationResponse authenticate(String token) {
        User user = getUserFromToken(token);
        var newToken = jwtService.generateToken(user);
        return AuthenticationResponse.builder()
                .token(newToken)
                .build();
    }


    public UserResponse profile(String token) {
        User user = getUserFromToken(token);
        return UserResponse.builder()
                .id(user.getId())
                .username(user.getUsername())
                .nickname(user.getNickname())
                .date_of_signup(user.getDateOfSignup())
                .bio(user.getBio())
                .profile_img(user.getProfileImg())
                .is_public(user.isPublic())
                .build();
    }

    public User getUserFromToken(String token) {
        String jwt = token.substring(7);
        String username = jwtService.extractUsername(jwt);
        Optional<User> optionalUser = userRepository.findUserByUsername(username);
        if (optionalUser.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        return optionalUser.get();
    }

}
