package com.auo.backend.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "app_group_events")
public class GroupEvent {
    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne
    private GroupMember groupMember;

    @NotBlank
    private String title;

    private String description;

    private String location;

    @ManyToOne
    private Group group;

    private LocalDateTime creationDate;

    private LocalDateTime eventDate;

    
}
