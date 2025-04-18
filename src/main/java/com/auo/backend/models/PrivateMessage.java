package com.auo.backend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "app_private_messages", indexes = {
        @Index(name = "index_private_message_sender_user",columnList = "sender_user_id"),
        @Index(name = "index_private_message_recipient_user",columnList = "recipient_user_id")
})
public class PrivateMessage {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    @JoinColumn(name = "sender_user_id")
    private User sender;

    @ManyToOne
    @JoinColumn(name = "recipient_user_id")
    private User recipient;

    private String message;

    private Date date;

    @PrePersist
    protected void onCreate() {
        if (date == null) {
            this.date = new Date();
        }
    }
}
