package com.auo.backend.user.vehicles;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "app_user_vehicles")
public class Vehicle {
    @Id
    private Long vehicle_id;
    private Long user_id;
    private String manufacturer;
    private String model;
    private String type;
    private Integer horsepower;
    private String description;
    private Integer displacement;

    public Vehicle() {
    }

    public Vehicle(Long user_id, String manufacturer, String model, String type, Integer horsepower, String description, Integer displacement) {
        this.user_id = user_id;
        this.manufacturer = manufacturer;
        this.model = model;
        this.type = type;
        this.horsepower = horsepower;
        this.description = description;
        this.displacement = displacement;
    }

    public Vehicle(Long vehicle_id, Long user_id, String manufacturer, String model, String type, Integer horsepower, String description, Integer displacement) {
        this.vehicle_id = vehicle_id;
        this.user_id = user_id;
        this.manufacturer = manufacturer;
        this.model = model;
        this.type = type;
        this.horsepower = horsepower;
        this.description = description;
        this.displacement = displacement;
    }
}
