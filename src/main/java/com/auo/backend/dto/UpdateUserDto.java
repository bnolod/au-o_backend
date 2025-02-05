package com.auo.backend.dto;

import lombok.Data;
import lombok.Setter;

import java.time.LocalDate;

@Data
public class UpdateUserDto {
    private String nickname;
    private LocalDate date_of_birth;
    private String bio;
    private String profile_img;
}
