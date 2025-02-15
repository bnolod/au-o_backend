package com.auo.backend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "app_user_vehicles")
public class Vehicle {
    @Id
    @GeneratedValue
    private Long id;
    private String manufacturer;
    private String model;
    private String type;
    private Integer horsepower;
    private String description;
    private Integer displacement;
    private Integer productionYear;

    @ManyToOne
    User user;
}
