package com.auo.backend.repositories;

import com.auo.backend.models.PostImages;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostImageRepository extends JpaRepository<PostImages, Long> {
}
