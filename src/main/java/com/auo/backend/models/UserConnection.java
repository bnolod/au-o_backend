package com.auo.backend.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "app_user_connections", uniqueConstraints = {@UniqueConstraint(columnNames={"user_id","following_user_id"})})
public class UserConnection {
    @Id
    @GeneratedValue
    private Long connectionId;

    @NotNull
    @ManyToOne
    private User user;

    @NotNull
    @ManyToOne
    private User followedUser;

    private Boolean isValid;

    @PrePersist
    protected void onCreate() {
        if(this.isValid == null) {
            this.isValid = true;
        }
    }

}
