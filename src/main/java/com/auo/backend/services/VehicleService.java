package com.auo.backend.services;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.auth.GenericOwnershipCheckerService;
import com.auo.backend.dto.create.CreateVehicleDto;
import com.auo.backend.dto.update.UpdateVehicleDto;
import com.auo.backend.models.User;
import com.auo.backend.models.Vehicle;
import com.auo.backend.repositories.VehicleRepository;
import com.auo.backend.responses.VehicleResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class VehicleService {
    private final UserService userService;
    private final AuthenticationService authenticationService;
    private final VehicleRepository vehicleRepository;
    private final GenericOwnershipCheckerService<User, Vehicle> vehicleOwnershipCheckerService;

    public VehicleResponse createVehicle(String token, CreateVehicleDto dto) {
        User user = authenticationService.getUserFromToken(token);
        Vehicle vehicle = vehicleRepository.save(Vehicle.builder()
                .type(dto.getType())
                .model(dto.getModel())
                .description(dto.getDescription())
                .displacement(dto.getDisplacement())
                .horsepower(dto.getHorsepower())
                .manufacturer(dto.getManufacturer())
                .productionYear(dto.getProductionYear())
                .user(user)
                .build());
        return new VehicleResponse(vehicle, user);
    }

    public List<VehicleResponse> getOwnVehicles(String token) {
        User user = authenticationService.getUserFromToken(token);
        return findVehiclesByUserId(user.getId()).stream().map(
                vehicle -> new VehicleResponse(vehicle, user)
        ).toList();
    }

    public List<VehicleResponse> getVehiclesOfUserByUserId(Long userId) {
        User target = userService.findUserByIdOrThrow(userId);
        return findVehiclesByUserId(userId).stream().map(
                vehicle -> new VehicleResponse(vehicle, target)).toList();
    }

    public VehicleResponse modifyOwnVehicleById(String token, Long vehicleId, UpdateVehicleDto dto) {
        User user = authenticationService.getUserFromToken(token);
        Vehicle vehicle = findOwnVehicleAndCheckOwnership(user, vehicleId);
        vehicle = vehicleRepository.save(modifyVehicleByDto(vehicle, dto));
        return new VehicleResponse(vehicle, user);
    }

    public VehicleResponse getVehicleById(Long id) {
        Vehicle vehicle = findVehicleByIdOrThrow(id);
        return new VehicleResponse(vehicle, vehicle.getUser());
    }

    public void deleteVehicleByIdFromSelf(String token, Long id) {
        User user = authenticationService.getUserFromToken(token);
        Vehicle vehicle = findOwnVehicleAndCheckOwnership(user, id);
        vehicleRepository.delete(vehicle);
    }


    public Vehicle findVehicleByIdOrThrow(Long id) {
        Optional<Vehicle> optionalVehicle = vehicleRepository.findById(id);
        if (optionalVehicle.isEmpty()) throw new ResponseStatusException(HttpStatus.NOT_FOUND, "vehicle_not_found");
        return optionalVehicle.get();
    }

    public List<Vehicle> findVehiclesByUserId(Long id) {
        return vehicleRepository.findByUser_Id(id);
    }

    public List<Vehicle> findVehiclesByUser(User user) {
        return vehicleRepository.findByUser_Id(user.getId());
    }

    public Vehicle findOwnVehicleAndCheckOwnership(User user, Long vehicleId) {
        Vehicle targetVehicle = findVehicleByIdOrThrow(vehicleId);
        if (vehicleOwnershipCheckerService.isNotOwnerOf(user, targetVehicle))
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "unauthorized");
        return targetVehicle;
    }

    public Vehicle modifyVehicleByDto(Vehicle target, UpdateVehicleDto dto) {
        if (dto.getManufacturer() != null)
            target.setManufacturer(dto.getManufacturer());
        if (dto.getDescription() != null)
            target.setDescription(dto.getDescription());
        if (dto.getDisplacement() != null)
            target.setDisplacement(dto.getDisplacement());
        if (dto.getType() != null)
            target.setType(dto.getType());
        if (dto.getModel() != null)
            target.setModel(dto.getModel());
        if (dto.getHorsepower() != null)
            target.setHorsepower(dto.getHorsepower());
        if (dto.getProductionYear() != null)
            target.setProductionYear(dto.getProductionYear());
        return target;
    }
}
