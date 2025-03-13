package com.auo.backend.dto.create;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class AddCommentDto {
    @Size(min = 1, message = "comment too short")
    @Size(max = 255, message = "comment too long")
    private String text;
}
