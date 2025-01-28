package com.auo.backend.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Builder
@Table(name = "app_post_images")
public class PostImages {
    @Id
    @GeneratedValue
    private Long id;

    @NotNull
    private String url;

    @NotNull
    private int index;
}
