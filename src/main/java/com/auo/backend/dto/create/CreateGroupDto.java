package com.auo.backend.dto.create;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class CreateGroupDto {
    @NotNull
    @Min(4)
    @Max(48)
    private String name;

    @NotNull
    @Max(256)
    private String description;

    @NotNull
    private String bannerImage;

    private String alias;

}
