package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.dto.CreateVehicleDto;
import com.auo.backend.models.User;
import com.auo.backend.models.Vehicle;
import com.auo.backend.repositories.VehicleRepository;
import com.auo.backend.responses.VehicleResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class VehicleService {
    private final UserService userService;
    private final AuthenticationService authenticationService;
    private final VehicleRepository vehicleRepository;

    public VehicleResponse createVehicle(String token, CreateVehicleDto dto) {
        User user = authenticationService.getUserFromToken(token);
        Vehicle vehicle = vehicleRepository.save(Vehicle.builder()
                .type(dto.getType())
                .model(dto.getModel())
                .description(dto.getDescription())
                .displacement(dto.getDisplacement())
                .horsepower(dto.getHorsepower())
                .manufacturer(dto.getManufacturer())
                .user_id(user.getId())
                .build());
        return new VehicleResponse(vehicle,user);
    }


}
