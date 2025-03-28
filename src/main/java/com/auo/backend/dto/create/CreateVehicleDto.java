package com.auo.backend.dto.create;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.time.LocalDate;

@Data
public class CreateVehicleDto {
    @NotBlank
    @Size(min = 2, message = "manufacturer too long")
    @Size(max = 32, message = "manufacturer too long")
    private String manufacturer;

    @NotBlank
    @Size(min = 2, message = "manufacturer too long")
    @Size(max = 32, message = "manufacturer too long")
    private String model;

    @NotBlank
    private String type;

    @NotBlank
    @Max(2000)
    @Min(1)
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
