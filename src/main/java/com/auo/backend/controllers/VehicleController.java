package com.auo.backend.controllers;

import com.auo.backend.dto.CreateVehicleDto;
import com.auo.backend.responses.VehicleResponse;
import com.auo.backend.services.VehicleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping(path = "api/v1/vehicles")
public class VehicleController {

    private final VehicleService vehicleService;

    @PostMapping("/vehicle/create")
    public ResponseEntity<VehicleResponse> createVehicle(@RequestHeader(HttpHeaders.AUTHORIZATION) String token,
                                                         @RequestBody CreateVehicleDto createVehicleDto) {
        return ResponseEntity.ok(vehicleService.createVehicle(token, createVehicleDto));
    }
}
