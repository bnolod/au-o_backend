package com.auo.backend.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString(exclude = {"user","group"})
@Entity
@Table(name = "app_group_messages", indexes = {
        @Index(name = "index_group_message_group",columnList = "group_id")
})
public class GroupMessage {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    private Group group;

    @ManyToOne
    private User user;

    private String message;

    private LocalDateTime time;

    @PrePersist
    protected void onCreate() {
        if (time == null) {
            time = LocalDateTime.now();
        }
    }
}
