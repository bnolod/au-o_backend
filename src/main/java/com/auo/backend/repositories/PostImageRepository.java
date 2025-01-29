package com.auo.backend.repositories;

import com.auo.backend.models.PostImages;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostImageRepository extends JpaRepository<PostImages, Long> {
}
