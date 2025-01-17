package com.auo.backend.auth;

import com.auo.backend.dto.UserLoginDto;
import com.auo.backend.dto.UserRegisterDto;
import com.auo.backend.enums.UserRole;
import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
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
    private final AuthenticationManager authenticationManager;

    public AuthenticationResponse register(UserRegisterDto userRegisterDto) {
        var user = User.builder()
                .username(userRegisterDto.getUsername())
                .password(passwordEncoder.encode(userRegisterDto.getPassword()))
                .email(userRegisterDto.getEmail())
                .role(UserRole.USER)
                .date_of_birth(userRegisterDto.getDate_of_birth())
                .nickname(userRegisterDto.getNickname())
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
}
