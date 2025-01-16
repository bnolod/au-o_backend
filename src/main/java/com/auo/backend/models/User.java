package com.auo.backend.models;



import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "app_user")
public class User implements UserDetails {

    @Getter
    @Id
    @SequenceGenerator(
            name = "user_sequence",
            sequenceName = "user_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "user_sequence"
    )
    private Long user_id;

    @Getter
    @Setter
    @Column(unique = true, nullable = false)
    private String username;

    @Getter
    @Setter
    private String password;

    @Getter
    @Setter
    @NotNull
    private String nickname;

    @Getter
    @Setter
    @NotNull
    private Integer role_id;

    @Getter
    @Setter
    @Column(unique = true, nullable = false)
    private String email;

    @Getter
    @Setter
    private boolean is_public;

    @Getter
    @Setter
    private String profile_img;

    @Getter
    @Setter
    private String bio;

    @Getter
    @Setter
    @NotNull
    private LocalDate date_of_birth;

    @Getter
    @NotNull
    private LocalDate date_of_signup;


    @PrePersist
    protected void onCreate() {
        if (this.date_of_signup == null) {
            this.date_of_signup = LocalDate.now();
        }
    }

    public User() {}

    public User(Long user_id, String username, String password, String nickname, Integer role_id, String email, boolean isPublic, String profile_img, String bio, LocalDate date_of_birth) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.role_id = role_id;
        this.email = email;
        this.is_public = isPublic;
        this.profile_img = profile_img;
        this.bio = bio;
        this.date_of_birth = date_of_birth;
    }

    public User(String username, String password, String nickname, Integer role_id, String email, boolean isPublic, String profile_img, String bio, LocalDate date_of_birth) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.role_id = role_id;
        this.email = email;
        this.is_public = isPublic;
        this.profile_img = profile_img;
        this.bio = bio;
        this.date_of_birth = date_of_birth;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of();
    }

    @Override
    public boolean isAccountNonExpired() {
        return UserDetails.super.isAccountNonExpired();
    }

    @Override
    public boolean isAccountNonLocked() {
        return UserDetails.super.isAccountNonLocked();
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return UserDetails.super.isCredentialsNonExpired();
    }

    @Override
    public boolean isEnabled() {
        return UserDetails.super.isEnabled();
    }
}
