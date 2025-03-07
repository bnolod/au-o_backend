package com.auo.backend.responses;

import com.auo.backend.message.outgoing.PrivateMessageResponse;
import com.auo.backend.models.PrivateMessage;
import com.auo.backend.models.User;
import lombok.Data;

@Data
public class LatestMessageResponse extends UserResponse{
    private boolean isActive;
    private PrivateMessageResponse message;
    public LatestMessageResponse(User user, PrivateMessage message, boolean isActive) {
        super(user);
        this.isActive = isActive;
        this.message = new PrivateMessageResponse(message);
    }
}
