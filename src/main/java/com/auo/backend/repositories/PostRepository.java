package com.auo.backend.repositories;

import com.auo.backend.models.Post;
import com.auo.backend.models.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface PostRepository extends JpaRepository<Post, UUID> {

    Optional<Post> findPostById(Long id);

    Page<Post> findAll(Pageable pageable);

    @Query("SELECT p FROM Post p " +
            "JOIN p.user u " +  // Explicit join to user
            "LEFT JOIN p.groupMember gm " +  // Join groupMember if exists
            "LEFT JOIN gm.group g " +  // Join group
            "WHERE p.dateOfCreation < :time " +
            "AND (" +
            "  u.isPublic = true " +  // User has public profile
            "  OR g.isPublic = true " +  // Group is public
            "  OR EXISTS (SELECT 1 FROM User u2 JOIN u2.following f " +
            "            WHERE u2.id = :userId AND f = u) " +  // User follows the post's author
            "  OR EXISTS (SELECT 1 FROM GroupMember gm2 " +
            "            WHERE gm2.user.id = :userId AND gm2.group = g AND gm2.isValid = true) " +  // User is in the group
            ") " +
            "AND u.id != :userId " +
            "ORDER BY p.dateOfCreation DESC")
    Page<Post> findPostsForUserFeed(Pageable pageable, @Param("userId") Long userId, @Param("time") LocalDateTime time);


}
