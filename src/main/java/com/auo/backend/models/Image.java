package com.auo.backend.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Builder
@Table(name = "app_images")
public class Image {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "url")
    private String url;

    @NotNull
    @Column(name = "index")
    private int index;

    @NotNull
    @Column(name = "delete_hash")
    private String deleteHash;

    @ManyToOne()
    @JoinColumn(name = "post_id", nullable = false)
    @JsonBackReference
    private Post post;
}

