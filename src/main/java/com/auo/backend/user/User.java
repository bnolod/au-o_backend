package com.auo.backend.user;

import lombok.Getter;
import lombok.Setter;

public class User {
    @Getter
    @Setter
    private Long id;
    @Getter
    @Setter
    private String Username;
    @Getter
    @Setter
    private String Password;
    @Getter
    @Setter
    private String nickname;
    @Getter
    @Setter
    private Long roleId;
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

    public User(Long id, String username, String password, String nickname, Long roleId, String email, boolean isPublic, String profile_img, String bio) {
        this.id = id;
        Username = username;
        Password = password;
        this.nickname = nickname;
        this.roleId = roleId;
        this.email = email;
        this.isPublic = isPublic;
        this.profile_img = profile_img;
        this.bio = bio;
    }

    public User(String username, String password, String nickname, Long roleId, String email, boolean isPublic, String profile_img, String bio) {
        Username = username;
        Password = password;
        this.nickname = nickname;
        this.roleId = roleId;
        this.email = email;
        this.isPublic = isPublic;
        this.profile_img = profile_img;
        this.bio = bio;
    }

}
