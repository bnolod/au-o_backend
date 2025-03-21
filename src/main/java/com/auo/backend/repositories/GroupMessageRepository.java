package com.auo.backend.repositories;

import com.auo.backend.models.Group;
import com.auo.backend.models.GroupMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GroupMessageRepository extends JpaRepository<GroupMessage, Long> {
    List<GroupMessage> getGroupMessagesByGroupOrderByTimeDesc(Group group);
}
