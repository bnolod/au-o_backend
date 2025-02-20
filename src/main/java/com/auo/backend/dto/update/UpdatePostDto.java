package com.auo.backend.dto.update;

import jakarta.validation.constraints.Max;
import lombok.Data;

@Data
public class UpdatePostDto {
    String text;
    String location;
    Long vehicleId;
}
