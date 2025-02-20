package com.auo.backend.dto.create;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.util.List;

@Data
public class CreatePostDto {
    private Long vehicleId;

    @Max(256)
    private String text;

    @NotBlank
    private List<ImageDto> postImages;

    @Max(32)
    private String location;
}
