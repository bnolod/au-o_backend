package com.auo.backend.dto.create;

import lombok.Data;

@Data
public class CreateEventDto {
    private Long groupId;
    private String name;
    private String description;
    private String location;
}
