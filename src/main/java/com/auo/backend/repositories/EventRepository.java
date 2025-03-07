package com.auo.backend.repositories;

import com.auo.backend.models.GroupEvent;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository<GroupEvent, Long> {
}
