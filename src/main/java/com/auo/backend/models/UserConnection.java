package com.auo.backend.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;

@Entity
@Table(name = "app_user_connections", uniqueConstraints = {@UniqueConstraint(columnNames={"user_id","following_user_id"})})
public class UserConnection {
    @Id
    private Long connection_id;
    private Long user_id;
    private Long following_user_id;

    public UserConnection() {
    }

    public UserConnection(Long user_id, Long following_user_id) {
        this.user_id = user_id;
        this.following_user_id = following_user_id;
    }

    public UserConnection(Long connection_id, Long user_id, Long following_user_id) {
        this.connection_id = connection_id;
        this.user_id = user_id;
        this.following_user_id = following_user_id;
    }
}
