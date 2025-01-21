package com.auo.backend.models;

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


}
