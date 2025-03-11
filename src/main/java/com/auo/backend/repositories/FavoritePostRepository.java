package com.auo.backend.repositories;

import com.auo.backend.models.FavoritePost;
import com.auo.backend.models.Post;
import com.auo.backend.models.User;
import com.auo.backend.responses.PostResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FavoritePostRepository extends JpaRepository<FavoritePost, Long> {
    Optional<FavoritePost> getFavoritePostByUserAndPost(User user, Post post);

    List<FavoritePost> getFavoritePostByUser(User targetUser);
}

