package com.auo.backend.auth;

import com.auo.backend.dto.UserLoginDto;
import com.auo.backend.dto.UserRegisterDto;
import com.auo.backend.models.User;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

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

}
