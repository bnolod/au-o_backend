package com.auo.backend.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
public class UserRegisterDto {
    private String username;
    private String nickname;
    private String password;
    private String email;
    private LocalDate date_of_birth;

}
