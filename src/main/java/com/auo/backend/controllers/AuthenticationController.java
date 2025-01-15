package com.auo.backend.controllers;

import com.auo.backend.dto.UserLoginDto;
import com.auo.backend.dto.UserRegisterDto;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/auth")
public class AuthenticationController {
    @PostMapping("/login")
    public String Login(@RequestBody UserLoginDto userLoginDto) {
        return "jwttokentobeimplemented"+userLoginDto.getUsernameOrEmail()+userLoginDto.getPassword();
    }
    @PostMapping("/register")
    public String Register(@RequestBody UserRegisterDto userRegisterDto) {
        return "jwttokentobeimplemented"+userRegisterDto.getUsername()+userRegisterDto.getPassword()+userRegisterDto.getEmail()+userRegisterDto.getNickname()+userRegisterDto.getDate_of_birth();
    }
}
