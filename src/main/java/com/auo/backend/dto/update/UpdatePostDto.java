package com.auo.backend.dto.update;

import jakarta.validation.constraints.Max;
import lombok.Data;

@Data
public class UpdatePostDto {
    @Max(256)
    String text;
    @Max(32)
    String location;
    Long vehicleId;
}
