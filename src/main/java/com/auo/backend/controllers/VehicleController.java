package com.auo.backend.controllers;

import com.auo.backend.dto.create.CreateVehicleDto;
import com.auo.backend.dto.update.UpdateVehicleDto;
import com.auo.backend.responses.VehicleResponse;
import com.auo.backend.services.VehicleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping(path = "api/v1/vehicles")
public class VehicleController {

    private final VehicleService vehicleService;

    @PostMapping("/vehicle/create")
    public ResponseEntity<VehicleResponse> createVehicle(@RequestBody CreateVehicleDto createVehicleDto) {
        return ResponseEntity.ok(vehicleService.createVehicle( createVehicleDto));
    }

    @GetMapping("/own")
    public ResponseEntity<List<VehicleResponse>> getOwnVehicles() {
        return ResponseEntity.ok(vehicleService.getOwnVehicles());
    }

    @PutMapping("/vehicle/{vehicleId}")
    public ResponseEntity<VehicleResponse> modifyOwnVehicle(@PathVariable Long vehicleId,
                                                            @RequestBody UpdateVehicleDto updateVehicleDto) {
        return ResponseEntity.ok(vehicleService.modifyOwnVehicleById(vehicleId,updateVehicleDto));
    }

    @GetMapping("/user/{userId}/all")
    public ResponseEntity<List<VehicleResponse>> getAllVehiclesOfUserById(@PathVariable Long userId) {
        return ResponseEntity.ok(vehicleService.getVehiclesOfUserByUserId(userId));
    }

    @GetMapping("/vehicle/{vehicleId}")
    public ResponseEntity<VehicleResponse> getVehicleById(@PathVariable Long vehicleId) {
        return ResponseEntity.ok(vehicleService.getVehicleById(vehicleId));
    }

    @DeleteMapping("/vehicle/{vehicleId}")
    public void deleteOwnVehicleById(@PathVariable Long vehicleId) {
        vehicleService.deleteVehicleByIdFromSelf( vehicleId);
    }
}
