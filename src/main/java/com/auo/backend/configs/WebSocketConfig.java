package com.auo.backend.configs;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.auth.JwtService;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {


    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        // Register the STOMP endpoint that clients can connect to (sockJS is enabled)
        registry.addEndpoint("/ws")
                .addInterceptors(new JwtHandshakeInterceptor()) // Add the interceptor
                .setAllowedOriginPatterns("*")
//                .setAllowedOrigins("*")
                .withSockJS();

    }



    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        // Simple in-memory broker for topics, queues, etc.
        registry.enableSimpleBroker("/topic", "/queue"); // Prefix for message destinations
        registry.setApplicationDestinationPrefixes("/app"); // Prefix for app-specific messages
    }
}
