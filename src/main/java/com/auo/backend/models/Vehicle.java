package com.auo.backend.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@ToString(exclude = {"user"})
@Table(name = "app_user_vehicles", indexes = {
        @Index(name = "index_vehicle_user", columnList = "user_id")
})
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

    @OneToMany(cascade = CascadeType.ALL)
    private List<Post> post;
}
