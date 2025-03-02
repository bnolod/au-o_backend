package com.auo.backend.dto.update;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class UpdateVehicleDto {

    private String manufacturer;

    private String model;

    private String type;

    @Max(9998)
    @Min(0)
    private Integer horsepower;

    private String description;

    @Max(110)
    @Min(0)
    private Integer displacement;

    @Min(1900)
    @Max(9999)
    private Integer productionYear;
}
