package com.auo.backend.auth;

import com.auo.backend.models.User;
import com.auo.backend.models.UserConnection;
import com.auo.backend.repositories.UserConnectionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ViewPermissionCheckerService {
    // csak boolean fuggvenyek :)
    private final UserConnectionRepository userConnectionRepository;



    // tesztelni kell
    public boolean canViewProfile(User usingUser, User toBeViewedUser) {
        if (toBeViewedUser.isPublic()) {
            return true;
        }
        Optional<UserConnection> connection = userConnectionRepository.findUserConnectionByUserIdAndFollowingUserId(usingUser.getId(), toBeViewedUser.getId());
        return connection.isPresent();
    }


}

