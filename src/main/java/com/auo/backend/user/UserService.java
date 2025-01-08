package com.auo.backend.user;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    public List<User> getUsers() {
        return List.of(new User(
                1L,
                "felh1",
                "nick",
                "jelszo",
                3L,
                "user@email.com",
                true,
                "imgsrc",
                "biotext"

        ));
    }
}
