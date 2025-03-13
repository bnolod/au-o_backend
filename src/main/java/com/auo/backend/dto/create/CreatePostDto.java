package com.auo.backend.dto.create;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.util.List;

@Data
public class CreatePostDto {

    private Long vehicleId;

    @NotBlank
    @Size(max = 255, message = "description too long")
    private String text;

    @Valid
    private List<ImageDto> postImages;

    @Size(max = 32, message = "location too long")
    private String location;
}
