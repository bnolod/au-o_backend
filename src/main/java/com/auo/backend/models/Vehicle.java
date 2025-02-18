package com.auo.backend.models;

import jakarta.persistence.*;
import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString(exclude = {"user"})
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
    private User user;
}
