package com.auo.backend.dto.update;

import lombok.Data;

@Data
public class UpdateVehicleDto {
    private String manufacturer;
    private String model;
    private String type;
    private Integer horsepower;
    private String description;
    private Integer displacement;
    private Integer productionYear;
}
