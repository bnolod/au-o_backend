package com.auo.backend.message.incoming;

import lombok.Data;

@Data
public class TargetedMessage {
    private String message;
    private String username;
}
