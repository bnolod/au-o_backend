package com.auo.backend.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class UpdateUserDto {
    private String nickname;
    private LocalDate dateOfBirth;
    private String bio;
    private String profileImg;
}
