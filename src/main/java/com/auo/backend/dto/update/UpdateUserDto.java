package com.auo.backend.dto.update;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Data;

import java.time.LocalDate;

@Data
public class UpdateUserDto {
    @Min(4)
    @Max(48)
    private String nickname;

    private LocalDate dateOfBirth;

    @Max(256)
    private String bio;

    private String profileImg;
}
