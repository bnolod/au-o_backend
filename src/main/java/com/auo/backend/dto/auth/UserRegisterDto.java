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
    @Min(4)
    @Max(24)
    private String username;

    @NotBlank
    @Min(4)
    @Max(48)
    private String nickname;

    @NotBlank
    private String password;

    @NotBlank
    @Email
    private String email;

    @NotBlank
    private LocalDate dateOfBirth;

}
