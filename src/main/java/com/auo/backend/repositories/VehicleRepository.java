package com.auo.backend.repositories;

import com.auo.backend.models.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VehicleRepository extends JpaRepository<Vehicle, Long> {
    public List<Vehicle> findByUser_Id(Long id);
}
