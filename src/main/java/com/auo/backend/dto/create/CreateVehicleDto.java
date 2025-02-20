package com.auo.backend.dto.create;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.time.LocalDate;

@Data
public class CreateVehicleDto {
    @NotBlank
    private String manufacturer;

    @NotBlank
    private String model;

    @NotBlank
    private String type;

    @NotBlank
    @Max(9998)
    @Min(0)
    private Integer horsepower;

    @NotBlank
    private String description;

    @NotBlank
    @Max(110)
    @Min(0)
    private Integer displacement;

    @NotBlank
    @Min(1900)
    @Max(9999)
    private Integer productionYear;
}
