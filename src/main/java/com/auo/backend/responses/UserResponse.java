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
    private LocalDate dateOfSignup;
    private String profileImg;
    private boolean isPublic;
    private boolean isDeleted;

    public UserResponse (User user) {
    if (!user.isDeleted()) {
        this.username = user.getUsername();
        this.id = user.getId();
        this.nickname = user.getNickname();
        this.bio = user.getBio();
        this.dateOfSignup = user.getDateOfSignup();
        this.profileImg = user.getProfileImg();
        this.isPublic = user.isPublic();
        this.isDeleted = false;
    }
    this.isDeleted = true;

    }
}
