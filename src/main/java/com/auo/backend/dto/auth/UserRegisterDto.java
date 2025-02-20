package com.auo.backend.dto.auth;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.time.LocalDate;

@Data
public class UserRegisterDto {
    @NotBlank
    private String username;

    @NotBlank
    private String nickname;

    @NotBlank
    private String password;

    @NotBlank
    @Email
    private String email;

    private LocalDate dateOfBirth;

}
