package com.auo.backend.dto;

import com.auo.backend.models.Image;
import lombok.Data;

import java.util.List;

@Data
public class CreatePostDto {
    private String text;
    private List<Image> postImages;
    private String location;
}
