package com.auo.backend.repositories;

import com.auo.backend.models.Group;
import com.auo.backend.models.Post;
import com.auo.backend.models.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface PostRepository extends JpaRepository<Post, UUID> {

    Optional<Post> findPostById(Long id);

    Page<Post> findAll(Pageable pageable);

    @Query("SELECT p FROM Post p " +
            "LEFT JOIN p.user u " +
            "LEFT JOIN p.groupMember gm " +
            "LEFT JOIN gm.group g " +
            "WHERE p.dateOfCreation < :time " +
            "AND (" +
            "  (u IS NOT NULL AND u.isPublic = true) " +
            "  OR (g IS NOT NULL AND g.isPublic = true) " +
            "  OR EXISTS (SELECT 1 FROM User u2 JOIN u2.following f " +
            "            WHERE u2.id = :userId AND f = u) " +
            "  OR EXISTS (SELECT 1 FROM GroupMember gm2 " +
            "            WHERE gm2.user.id = :userId AND gm2.group = g AND gm2.isValid = true) " +
            ") " +
            "AND (u IS NULL OR u.id != :userId) " +
            "AND (gm IS NULL OR gm.user.id IS NULL OR gm.user.id != :userId) " +
            "ORDER BY p.dateOfCreation DESC")
    Page<Post> findPostsForUserFeed(Pageable pageable, @Param("userId") Long userId, @Param("time") LocalDateTime time);

    List<Post> findPostsByGroupMember_Group(Group groupMemberGroup);


    List<Post> getPostsByVehicle_Id(Long vehicleId);
}
