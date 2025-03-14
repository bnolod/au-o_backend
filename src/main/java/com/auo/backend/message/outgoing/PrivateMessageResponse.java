package com.auo.backend.message.outgoing;

import com.auo.backend.models.PrivateMessage;
import com.auo.backend.models.User;
import com.auo.backend.responses.UserResponse;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PrivateMessageResponse {
    private Long id;
    private UserResponse user;
    private String message;
    private String recipient;

    public PrivateMessageResponse(PrivateMessage privateMessage) {
        this.id = privateMessage.getId();
        this.user = new UserResponse(privateMessage.getSender());
        this.message = privateMessage.getMessage();
        this.recipient = privateMessage.getRecipient().getUsername();
    }


}
