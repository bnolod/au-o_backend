package com.auo.backend.dto.create;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class AddCommentDto {
    @NotBlank
    @Max(256)
    private String text;
}
