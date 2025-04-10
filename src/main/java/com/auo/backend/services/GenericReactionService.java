package com.auo.backend.services;

import com.auo.backend.enums.ReactionType;
import com.auo.backend.models.Reaction;
import com.auo.backend.models.User;
import com.auo.backend.utils.UserUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class GenericReactionService<T> {


    private final UserUtils userUtils;
    /**
     * Adds, removes, or updates a reaction on an item.
     *
     * @param item         The entity, e.g., Post, Comment, etc.
     * @param reactionType The reaction type (FIRE, HEART, COOL, etc.).
     * @return "ADDED", "UPDATED", or "REMOVED" depending on the action taken.
     */
    @Transactional
    public String addOrRemoveReactionToItem(T item, ReactionType reactionType) {
        User user = userUtils.getCurrentUser();

        try {
            for (Field field : item.getClass().getDeclaredFields()) {
                field.setAccessible(true);

                if (field.getType().equals(List.class) && field.getName().equals("reactions")) {
                    Object fieldValue = field.get(item);

                    if (fieldValue instanceof List<?>) {
                        @SuppressWarnings("unchecked")
                        List<Reaction> reactions = (List<Reaction>) fieldValue;

                        Optional<Reaction> existingReactionOpt = reactions.stream()
                                .filter(r -> r.getUser().equals(user))
                                .findFirst();

                        if (existingReactionOpt.isPresent()) {
                            Reaction existingReaction = existingReactionOpt.get();

                            if (existingReaction.getReactionType() == reactionType) {
                                reactions.remove(existingReaction);
                                return "REMOVED";
                            } else {
                                existingReaction.setReactionType(reactionType);
                                return "UPDATED";
                            }
                        } else {
                            Reaction newReaction = Reaction.builder()
                                    .user(user)
                                    .reactionType(reactionType)
                                    .build();
                            reactions.add(newReaction);
                            return "ADDED";
                        }
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error processing reactions", e);
        }
        return null;
    }


}
