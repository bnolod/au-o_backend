package com.auo.backend.controllers;

import com.auo.backend.dto.UserLoginDto;
import com.auo.backend.dto.UserRegisterDto;
import com.auo.backend.models.User;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

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

    @PostMapping("/profile")
    public User Profile(@RequestBody String token) {
        return new User("username","pw nem kell","nick",2,token,true,null,null, LocalDate.parse("2001-09-11"));
    }
}
