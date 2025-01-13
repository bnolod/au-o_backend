package com.auo.backend.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="app_user_roles")
public class UserRole {
    @Getter
    @Setter
    @Id
    private Integer role_id;
    @Getter
    @Setter
    private String role;

    public UserRole(String role) {
        this.role = role;
    }

    public UserRole(Integer role_id, String role) {
        this.role_id = role_id;
        this.role = role;
    }

    public UserRole() {

    }
}
