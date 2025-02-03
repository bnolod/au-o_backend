package com.auo.backend.repositories;

import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.Reaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ReactionRepository extends JpaRepository<Reaction, Long> {
}
