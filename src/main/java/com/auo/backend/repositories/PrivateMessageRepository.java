package com.auo.backend.repositories;

import com.auo.backend.models.PrivateMessage;
import com.auo.backend.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PrivateMessageRepository extends JpaRepository<PrivateMessage, Long> {

    @Query("SELECT pm FROM PrivateMessage pm WHERE " +
            "(pm.sender.id = :senderId AND pm.recipient.id = :recipientId)" +
            "OR" +
            "(pm.sender.id = :recipientId AND pm.recipient.id = :senderId)" +
            "order by pm.date desc")
    List<PrivateMessage> getBySenderIdAndRecipientId(Long senderId, Long recipientId);
}
