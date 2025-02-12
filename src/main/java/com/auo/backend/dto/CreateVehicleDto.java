package com.auo.backend.dto;

import lombok.Data;

@Data
public class CreateVehicleDto {
    private String manufacturer;
    private String model;
    private String type;
    private Integer horsepower;
    private String description;
    private Integer displacement;
}
