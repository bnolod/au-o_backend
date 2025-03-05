package com.auo.backend.message.outgoing;


import com.auo.backend.models.User;
import com.auo.backend.responses.UserResponse;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ChatMessage {
    private UserResponse user;
    private String message;

    public ChatMessage(User user, String message) {
        this.user = new UserResponse(user);
        this.message = message;
    }
}
