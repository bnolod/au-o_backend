package com.auo.backend.dto.create;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import org.hibernate.validator.constraints.URL;

@Data
public class ImageDto {
    @NotBlank
    @URL
    private String url;
    @NotBlank
    private String deleteHash;
}
