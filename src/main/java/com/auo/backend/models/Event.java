package com.auo.backend.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.UUID;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "app_group_events")
public class Event {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    private GroupMember groupMember;

    private String title;

    private String description;

    private LocalDateTime creationDate;

    private LocalDateTime eventDate;

    
}
