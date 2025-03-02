package com.auo.backend.dto.auth;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserLoginDto {
    @NotBlank(message = "Username or Email is mandatory")
    private String usernameOrEmail;
    @NotBlank(message = "Password is mandatory")
    private String password;
}
