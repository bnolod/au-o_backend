package com.auo.backend.auth;

import com.auo.backend.dto.auth.UserLoginDto;
import com.auo.backend.dto.auth.UserRegisterDto;
import com.auo.backend.responses.UserResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
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
            @Valid @RequestBody UserRegisterDto userRegisterDto,
            HttpServletResponse response
    ) {
        return ResponseEntity.ok(authenticationService.register(userRegisterDto, response));
    }

    @PostMapping("/login")
    public ResponseEntity<AuthenticationResponse> login (
            @Valid @RequestBody UserLoginDto userLoginDto,
            HttpServletResponse response
    ) {
        return ResponseEntity.ok(authenticationService.login(userLoginDto, response));
    }

    @PostMapping("/authenticate")
    public ResponseEntity<AuthenticationResponse> authenticate() {
        return ResponseEntity.ok(authenticationService.authenticate( ));
    }

    @GetMapping("/profile")
    public ResponseEntity<UserResponse> profile() {
        return ResponseEntity.ok(authenticationService.profile());
    }

    @PostMapping("/logout")
    public void logout(HttpServletResponse response) {
        Cookie cookie = new Cookie("token", null);
        cookie.setHttpOnly(true);
        cookie.setSecure(false);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }

}
