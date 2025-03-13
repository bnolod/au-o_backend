package com.auo.backend.dto.auth;

import jakarta.validation.constraints.*;
import lombok.Data;

import java.time.LocalDate;

@Data
public class UserRegisterDto {
    @NotBlank
    @Size(min = 3, message = "username too short")
    @Size(max = 24, message = "username too long")
    private String username;

    @NotBlank
    @Size(min = 3, message = "nickname too short")
    @Size(max = 24, message = "nickname too long")
    private String nickname;

    @NotBlank
    private String password;

    @NotBlank
    @Email
    private String email;

    private LocalDate dateOfBirth;

}
