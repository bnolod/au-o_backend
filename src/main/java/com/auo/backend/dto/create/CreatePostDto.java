package com.auo.backend.dto.create;
import lombok.Data;

import java.util.List;

@Data
public class CreatePostDto {
    private Long vehicleId;
    private String text;
    private List<ImageDto> postImages;
    private String location;
}
