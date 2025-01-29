package com.auo.backend.responses;


import com.auo.backend.models.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserResponse {
    private String username;
    private Long id;
    private String nickname;
    private String bio;
    private LocalDate date_of_signup;
    private String profile_img;
    private boolean is_public;

    public UserResponse (User user) {
        this.username = user.getUsername();
        this.id = user.getId();
        this.nickname = user.getNickname();
        this.bio = user.getBio();
        this.date_of_signup = user.getDateOfSignup();
        this.profile_img = user.getProfileImg();
        this.is_public = user.isPublic();
    }
}
