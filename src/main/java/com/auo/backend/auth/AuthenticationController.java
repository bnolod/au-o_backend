package com.auo.backend.auth;

import com.auo.backend.dto.auth.UserLoginDto;
import com.auo.backend.dto.auth.UserRegisterDto;
import com.auo.backend.responses.UserResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/auth")
@RequiredArgsConstructor
public class AuthenticationController {

    private final AuthenticationService authenticationService;

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register (
            @RequestBody UserRegisterDto userRegisterDto
    ) {
        return ResponseEntity.ok(authenticationService.register(userRegisterDto));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthenticationResponse> register (
            @RequestBody UserLoginDto userLoginDto
    ) {
        return ResponseEntity.ok(authenticationService.login(userLoginDto));
    }

    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> authenticate(
            @RequestHeader(HttpHeaders.AUTHORIZATION) String token
    ) {
        return ResponseEntity.ok(authenticationService.authenticate(token));
    }

    @GetMapping("/profile")
    public ResponseEntity<UserResponse> profile(
            @RequestHeader(HttpHeaders.AUTHORIZATION) String token
    ) {
        return ResponseEntity.ok(authenticationService.profile(token));
    }

}
