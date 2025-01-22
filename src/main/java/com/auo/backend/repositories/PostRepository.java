package com.auo.backend.repositories;

import com.auo.backend.enums.PostType;
import com.auo.backend.models.Post;
import com.auo.backend.responses.PostResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface PostRepository extends JpaRepository<Post, UUID> {
    // csoportbeli posztok VAGY eventek tipustol fuggoen + post update szerint idorendben
    Optional<ArrayList<Post>> findPostsByPostTypeAndGroupIdOrderByDateOfUpdateDesc(PostType postType, Long groupId);


}
