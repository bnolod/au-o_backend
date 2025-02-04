package com.auo.backend.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class CreateGroupDto {
    @NotNull
    private String name;

    @NotNull
    private String description;

    @NotNull
    private String bannerImage;

}
