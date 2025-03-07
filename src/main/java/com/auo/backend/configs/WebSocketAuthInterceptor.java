package com.auo.backend.configs;

import com.auo.backend.auth.JwtService;
import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import jakarta.servlet.http.Cookie;
import org.springframework.lang.NonNull;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.util.WebUtils;
import jakarta.servlet.http.HttpServletRequest;
import java.util.Optional;

@Component
public class WebSocketAuthInterceptor implements ChannelInterceptor {

    private final JwtService jwtService;
    private final UserRepository userRepository;

    public WebSocketAuthInterceptor(JwtService jwtService, UserRepository userRepository) {
        this.jwtService = jwtService;
        this.userRepository = userRepository;
    }


    @Override
    public Message<?> preSend(@NonNull Message<?> message,@NonNull MessageChannel channel) {
        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);
        String token = null;

        // Extract token from headers during WebSocket connection (Handshake phase)
        if (accessor.getCommand() == null || accessor.getCommand().equals("CONNECT")) {
            // Try to get token from query parameters (for SockJS clients)
            token = accessor.getFirstNativeHeader("token");
            if (token == null) {
                // If token is not in the header, try cookies (handle cookies during the connection phase)
                Cookie tokenCookie = WebUtils.getCookie((HttpServletRequest) accessor.getSessionAttributes().get("HTTP_REQUEST"), "token");
                if (tokenCookie != null) {
                    token = tokenCookie.getValue();
                }
            }
        }

        // Check if token is valid and starts with "Bearer "
        if (token != null && token.startsWith("Bearer ")) {
            token = token.substring(7); // Remove "Bearer " prefix
        }

        // If token is present, validate and authenticate the user
        if (token != null) {
            String username = jwtService.extractUsername(token);
            if (username != null) {
                try {

                    Optional<User> userOpt = userRepository.findUserByUsername(username);

                    if (userOpt.isPresent() && jwtService.isTokenValid(token, userOpt.get())) {
                        User user = userOpt.get();
                        UsernamePasswordAuthenticationToken auth =
                                new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());

                        // Set the authentication in the SecurityContext
                        SecurityContextHolder.getContext().setAuthentication(auth);
                        accessor.setUser(auth); // Attach authenticated user to WebSocket session
                        if (accessor.getSessionAttributes() != null) {
                            accessor.getSessionAttributes().put("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
                        }
                    }
                } catch (NumberFormatException e) {
                    // Handle invalid userId format (optional: ignore silently)
                }
            }
        }

        return message;
    }
}
