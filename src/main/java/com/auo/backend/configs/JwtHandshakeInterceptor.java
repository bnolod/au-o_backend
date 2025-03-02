package com.auo.backend.configs;

import com.auo.backend.auth.JwtService;
import io.jsonwebtoken.Claims;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import java.util.Map;

@Component
public class JwtHandshakeInterceptor implements HandshakeInterceptor {

    private final JwtService jwtService = new JwtService();


    @Override
    public boolean beforeHandshake(
            ServerHttpRequest request,
            ServerHttpResponse response,
            WebSocketHandler wsHandler,
            Map<String, Object> attributes) {

        if (request instanceof ServletServerHttpRequest) {
            HttpServletRequest servletRequest = ((ServletServerHttpRequest) request).getServletRequest();

            // Try to get the token from the query parameter
            String token = servletRequest.getParameter("token");

            // If token is not found in the query parameter, try to get it from the headers
            if (token == null || token.trim().isEmpty()) {
                token = request.getHeaders().getFirst("Authorization");
                if (token != null && token.startsWith("Bearer ")) {
                    token = token.substring(7); // Extract token part
                }
            }

            // Check if token is null or empty
            if (token == null || token.trim().isEmpty()) {
                System.err.println("No token found in query parameter or Authorization header");
                return false; // Reject the handshake if no token is found
            }

            try {
                // Extract claims from the token
                Claims claims = jwtService.extractAllClaims(token);
                String username = claims.getSubject();

                if (username != null) {
                    attributes.put("username", username); // Add username to WebSocket session attributes
                } else {
                    System.err.println("JWT token has no subject");
                    return false; // Reject if username (subject) is not found in the token
                }
            } catch (Exception e) {
                System.out.println("Received token: " + token);
                System.err.println("Error extracting claims from token: " + e.getMessage());
                return false; // Reject handshake if there's an error while parsing the JWT
            }
        }
        return true;
    }

    @Override
    public void afterHandshake(ServerHttpRequest request,
                               ServerHttpResponse response,
                               WebSocketHandler wsHandler,
                               Exception exception) {
        // No-op
    }
}