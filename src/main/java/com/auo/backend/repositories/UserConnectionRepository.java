package com.auo.backend.repositories;

import com.auo.backend.models.User;
import com.auo.backend.models.UserConnection;
import org.hibernate.mapping.Any;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Optional;

@Repository
public interface UserConnectionRepository extends JpaRepository<UserConnection,Long> {

    Optional<ArrayList<UserConnection>> findUserConnectionsByUserId(Long id);
    Optional<ArrayList<UserConnection>> findUserConnectionsByFollowingUserId(Long id);

    @Query(value = "select u from app_user u join  app_user_connections uc on u.user_id = uc.user_id where uc.following_user_id = ?1 ", nativeQuery = true)
    ArrayList<User> findFollowersByUserId(Long userId);
}
