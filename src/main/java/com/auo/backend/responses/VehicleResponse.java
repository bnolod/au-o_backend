package com.auo.backend.responses;

import com.auo.backend.models.User;
import com.auo.backend.models.Vehicle;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class VehicleResponse {
    private Long id;
    private String manufacturer;
    private String model;
    private String type;
    private Integer horsepower;
    private String description;
    private Integer displacement;
    private Integer productionYear;
    private UserResponse owner;

    public VehicleResponse(Vehicle vehicle, User user) {
        this.id = vehicle.getId();
        this.manufacturer = vehicle.getManufacturer();
        this.model = vehicle.getModel();
        this.type = vehicle.getType();
        this.horsepower = vehicle.getHorsepower();
        this.description = vehicle.getDescription();
        this.displacement = vehicle.getDisplacement();
        this.productionYear = vehicle.getProductionYear();
        if (user != null)
            this.owner = new UserResponse(user);
    }
}
