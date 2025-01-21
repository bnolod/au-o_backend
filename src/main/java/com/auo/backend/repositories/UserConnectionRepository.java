package com.auo.backend.repositories;

import com.auo.backend.models.UserConnection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Optional;

@Repository
public interface UserConnectionRepository extends JpaRepository<UserConnection,Long> {

    Optional<ArrayList<UserConnection>> findUserConnectionsByUserId(Long id);
    Optional<ArrayList<UserConnection>> findUserConnectionsByFollowingUserId(Long id);
}
