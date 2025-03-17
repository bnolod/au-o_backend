package com.auo.backend.dto.update;

import com.auo.backend.dto.create.ImageDto;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.util.List;

@Data
public class UpdatePostDto {

    private Long vehicleId;

    @NotBlank
    @Size(max = 255, message = "description too long")
    private String text;

    @Size(max = 32, message = "location too long")
    private String location;
}
