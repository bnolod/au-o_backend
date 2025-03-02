package com.auo.backend.configs;

import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.Map;

public class CustomWebSocketHandler extends TextWebSocketHandler {

    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        Map<String, Object> attributes = session.getAttributes();
        String username = (String) attributes.get("username");
        System.out.println("User connected: " + username);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        Map<String, Object> attributes = session.getAttributes();
        String username = (String) attributes.get("username");

        if (username != null) {
            // Send a response to the user
            session.sendMessage(new TextMessage("Hello " + username + ", you sent: " + message.getPayload()));
        } else {
            session.sendMessage(new TextMessage("Unauthorized"));
        }
    }
}
