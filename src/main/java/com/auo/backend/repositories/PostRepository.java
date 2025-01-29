package com.auo.backend.repositories;

import com.auo.backend.enums.PostType;
import com.auo.backend.models.Post;
import com.auo.backend.responses.PostResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface PostRepository extends JpaRepository<Post, UUID> {

    Optional<Post> findPostById(UUID uuid);


    // csoportbeli posztok VAGY eventek tipustol fuggoen + post creation, relevance csokkeno
    // timestamp

//    Optional<ArrayList<Post>> findPostsByPostTypeAndAndDateOfCreationBeforeOrderByDateOfCreationDescRelevanceDesc(PostType postType, Long groupId, LocalDateTime dateTime );

    // group tab feed funkcio:
    // posztok ahol tag a felhasznalo
    //

//    Optional<ArrayList<Post>> findPostsByUserForGroupFeed(@Param("userId") Long userId);

}
