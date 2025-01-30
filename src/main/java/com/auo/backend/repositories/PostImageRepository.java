package com.auo.backend.repositories;

import com.auo.backend.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostImageRepository extends JpaRepository<Image, Long> {
}
