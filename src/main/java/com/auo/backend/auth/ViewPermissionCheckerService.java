package com.auo.backend.auth;

import com.auo.backend.models.Post;
import com.auo.backend.models.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ViewPermissionCheckerService {
    /**
     *
     * @param user felhasználó ki megtekinteni kívánkozik bizonyost
     * @param post bizonyos feltételekkel megtekinthető posta
     * @return true/false
     */
    public static boolean isAbleToViewPost(User user, Post post) {
        if (post.getGroupMember() == null) {
            return post.getUser().isPublic();
        }

        if (!post.getGroupMember().getGroup().isPublic()) {
            if (user.getGroups().stream().anyMatch(groupMember ->
                    groupMember.getGroup().equals(post.getGroupMember().getGroup()))) {
                return true;
            }
        }

        return post.getGroupMember().getGroup().isPublic();
    }

    public static boolean isAbleToViewProfile(User user, User target) {
        if (user.equals(target))
            return true;
        if (target.isPublic())
            return true;
        if (user.getFollowing().contains(target))
            return true;
        return false;
    }
}

