package com.auo.backend.auth;

import com.auo.backend.dto.auth.UserLoginDto;
import com.auo.backend.dto.auth.UserRegisterDto;
import com.auo.backend.enums.UserRole;
import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.UserResponse;
import com.auo.backend.validationServices.UserValidationService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.Optional;


@Service
@RequiredArgsConstructor
public class AuthenticationService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final UserValidationService userValidationService;

    public AuthenticationResponse register(UserRegisterDto userRegisterDto, HttpServletResponse response) {
        if (!userValidationService.IsEmailValid(userRegisterDto.getEmail())) {
            throw new ResponseStatusException(HttpStatus.NOT_ACCEPTABLE, "invalid_email_format");
        }
        if (userRepository.findUserByUsername(userRegisterDto.getUsername()).isPresent())
            throw new ResponseStatusException(HttpStatus.CONFLICT, "username_taken");
        if (userRepository.findUserByEmail(userRegisterDto.getEmail()).isPresent())
            throw new ResponseStatusException(HttpStatus.CONFLICT, "email_taken");

        var user = User.builder()
                .username(userRegisterDto.getUsername())
                .password(passwordEncoder.encode(userRegisterDto.getPassword()))
                .email(userRegisterDto.getEmail())
                .role(UserRole.USER)
                .dateOfBirth(userRegisterDto.getDateOfBirth())
                .nickname(userRegisterDto.getNickname())
                .isPublic(true)
                .build();
        userRepository.save(user);
        var jwtToken = jwtService.generateToken(user);
        createTokenCookie(jwtToken,response);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }

    public AuthenticationResponse login(UserLoginDto userLoginDto, HttpServletResponse response) {
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
        createTokenCookie(jwtToken,response);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }

    public AuthenticationResponse authenticate(String token,HttpServletResponse response) {
        User user = getUserFromToken(token);
        var newToken = jwtService.generateToken(user);
        createTokenCookie(newToken,response);
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
                .dateOfSignup(user.getDateOfSignup())
                .bio(user.getBio())
                .profileImg(user.getProfileImg())
                .isPublic(user.isPublic())
                .build();
    }

    public User getUserFromToken(String token) {
        String jwt = token.substring(7);
        String username = jwtService.extractUsername(jwt);
        Optional<User> optionalUser = userRepository.findUserByUsername(username);
        if (optionalUser.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "no");
        }
        return optionalUser.get();
    }

    public void createTokenCookie(String token, HttpServletResponse response) {
        Cookie cookie = new Cookie("token",token);
        cookie.setHttpOnly(true);
        cookie.setSecure(false);
        cookie.setPath("*");
        cookie.setMaxAge(1000 * 60 * 60 * 24);
        response.addCookie(cookie);
    }

}
