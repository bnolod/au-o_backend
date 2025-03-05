package com.auo.backend.configs;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.*;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@RequiredArgsConstructor
@Configuration
@EnableWebSocketMessageBroker
public class CustomWebSocketHandler extends TextWebSocketHandler {
    private static final ConcurrentHashMap<String, WebSocketSession> activeUsers = new ConcurrentHashMap<>();


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

    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        String username = (String) session.getAttributes().get("username"); // Assuming username is stored in session attributes
        if (username != null) {
            activeUsers.put(username, session);
            System.out.println("user connected to websocket: "+ username);
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        activeUsers.values().removeIf(s -> s.equals(session));
    }

    public Set<String> getActiveUsers() {
        return activeUsers.keySet();
    }
}
