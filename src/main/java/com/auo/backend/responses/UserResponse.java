package com.auo.backend.responses;


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
    private Integer id;
    private String nickname;
    private String bio;
    private LocalDate date_of_signup;
    private String profile_img;
    private boolean is_public;
}
