package com.auo.backend.repositories;

import com.auo.backend.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    Optional<User> findUserById(Long id);
    Optional<User> findUserByUsername(String username);
    Optional<User> findUserByEmail(String email);

    Optional<List<User>> findUsersByFollowingContains(User user);

    List<User> findAllByUsernameIn(Collection<String> usernames);

    @Query(value = "SELECT * FROM app_users " +
            "WHERE username ILIKE :text " +
            "OR nickname ILIKE :text",
            nativeQuery = true)
    List<User> findUsersBySearch(@Param("text") String text);

}

