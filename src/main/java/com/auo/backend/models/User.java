package com.auo.backend.models;



import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "app_user")
public class User {
    @Getter
    @Setter
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
    private String username;
    @Getter
    @Setter
    private String password;
    @Getter
    @Setter
    private String nickname;
    @Getter
    @Setter
    private Integer role_id;
    @Getter
    @Setter
    private String email;
    @Getter
    @Setter
    private boolean isPublic;
    @Getter
    @Setter
    private String profile_img;
    @Getter
    @Setter
    private String bio;

    public User() {}

    public User(Long user_id, String username, String password, String nickname, Integer role_id, String email, boolean isPublic, String profile_img, String bio) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.role_id = role_id;
        this.email = email;
        this.isPublic = isPublic;
        this.profile_img = profile_img;
        this.bio = bio;
    }

    public User(String username, String password, String nickname, Integer role_id, String email, boolean isPublic, String profile_img, String bio) {
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.role_id = role_id;
        this.email = email;
        this.isPublic = isPublic;
        this.profile_img = profile_img;
        this.bio = bio;
    }

}
