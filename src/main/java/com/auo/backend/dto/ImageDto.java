package com.auo.backend.dto;
import com.auo.backend.models.Post;
import lombok.Data;

@Data
public class ImageDto {
    private String url;
    private String deleteHash;
}
