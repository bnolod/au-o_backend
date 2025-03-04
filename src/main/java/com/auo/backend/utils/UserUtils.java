package com.auo.backend.utils;

import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ResponseStatusException;

@Component
@RequiredArgsConstructor
public class UserUtils {


    public static User getCurrentUser() throws ResponseStatusException {
        try {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            return user;
        } catch (ClassCastException exception) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "not signed in");
        }

    }
}
