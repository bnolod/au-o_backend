package com.auo.backend.responses;

import com.auo.backend.models.GroupMessage;
import lombok.Data;

@Data
public class GroupMessageResponse {
    private Long id;
    private UserResponse user;
    private String message;

    protected GroupMessageResponse(GroupMessage groupMessage) {
        this.id = groupMessage.getId();
        this.user = new UserResponse(groupMessage.getUser());
        this.message = groupMessage.getMessage();
    }

    public static GroupMessageResponse ofMessage(GroupMessage groupMessage) {
        return new GroupMessageResponse(groupMessage);
    }
}
