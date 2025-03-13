package com.auo.backend.dto.update;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.time.LocalDate;

@Data
public class UpdateUserDto {

    @Size(min = 3, message = "nickname too short")
    @Size(max = 24, message = "nickname too long")
    private String nickname;

    private LocalDate dateOfBirth;

    @Size(max = 255, message = "bio too long")
    private String bio;

    private String profileImg;


}
