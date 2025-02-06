package com.auo.backend.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class UserRegisterDto {
    private String username;
    private String nickname;
    private String password;
    private String email;
    private LocalDate dateOfBirth;

}
