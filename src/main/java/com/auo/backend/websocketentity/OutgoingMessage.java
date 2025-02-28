package com.auo.backend.websocketentity;

import com.auo.backend.responses.UserResponse;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class OutgoingMessage {
    private String message;
    private UserResponse user;

}
