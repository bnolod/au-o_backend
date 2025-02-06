package com.auo.backend.dto;
import lombok.Data;

import java.util.List;

@Data
public class CreatePostDto {
    private String text;
    private List<ImageDto> postImages;
    private String location;
}
