package com.auo.backend.dto.create;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.util.List;

@Data
public class CreatePostDto {
    private Long vehicleId;

    @NotBlank
    private String text;

    @Valid
    private List<ImageDto> postImages;

    @NotBlank
    private String location;
}
