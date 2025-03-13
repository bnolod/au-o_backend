package com.auo.backend.dto.create;

import jakarta.validation.constraints.*;
import lombok.Data;
import org.hibernate.validator.constraints.URL;

@Data
public class CreateGroupDto {
    @NotBlank
    @Size(min = 6, message = "group name too short")
    @Size(max = 64, message = "group name too long")
    private String name;

    @Size(max = 255, message = "description too long")
    private String description;

    @URL
    private String bannerImage;

    @Size(max = 8, message = "alias too long")
    private String alias;

    private boolean isPublic;

}
