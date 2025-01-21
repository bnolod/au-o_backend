package com.auo.backend.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
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
    private Long connectionId;
    private Long userId;
    private Long followingUserId;

}
