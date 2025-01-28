package com.auo.backend.dto;

import com.auo.backend.enums.PostType;
import com.auo.backend.models.PostImages;
import lombok.Data;

import java.util.List;
import java.util.UUID;

@Data
public class CreatePostDto {
    private String text;
    private List<PostImages> postImages;
    private String location;
}
