package com.auo.backend.repositories;

import com.auo.backend.models.PrivateMessage;
import com.auo.backend.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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

    @Query(value = "SELECT pm.* FROM app_private_messages pm " +
            "INNER JOIN ( " +
            "    SELECT LEAST(sender_user_id, recipient_user_id) AS user1, " +
            "           GREATEST(sender_user_id, recipient_user_id) AS user2, " +
            "           MAX(date) AS latest_date " +
            "    FROM app_private_messages " +
            "    WHERE sender_user_id = :userId OR recipient_user_id = :userId " +
            "    GROUP BY LEAST(sender_user_id, recipient_user_id), GREATEST(sender_user_id, recipient_user_id) " +
            ") latest_messages " +
            "ON ( (pm.sender_user_id = latest_messages.user1 AND pm.recipient_user_id = latest_messages.user2) " +
            "     OR (pm.sender_user_id = latest_messages.user2 AND pm.recipient_user_id = latest_messages.user1) ) " +
            "AND pm.date = latest_messages.latest_date " +
            "ORDER BY pm.date DESC",
            nativeQuery = true)
    List<PrivateMessage> getLatestMessagesWithAllUsersMessagedWith(@Param("userId") Long userId);

}
