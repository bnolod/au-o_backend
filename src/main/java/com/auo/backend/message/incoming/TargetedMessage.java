package com.auo.backend.message.incoming;

import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class TargetedMessage {
    @Size(max = 255)
    private String message;
    private String username;
}
