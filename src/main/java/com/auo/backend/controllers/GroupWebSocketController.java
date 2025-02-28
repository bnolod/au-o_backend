package com.auo.backend.controllers;

import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.UserResponse;
import com.auo.backend.services.UserService;
import com.auo.backend.websocketentity.IncomingMessage;
import com.auo.backend.websocketentity.OutgoingMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.util.HtmlUtils;

import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class GroupWebSocketController {
    private final UserService userService;
    private final UserRepository userRepository;

    @MessageMapping("/group/{groupId}")  // Correct the path mapping to include the groupId
    @SendTo("/topic/group/{groupId}")  // Correctly use groupId in SendTo
    public OutgoingMessage testMessage(@Payload IncomingMessage incomingMessage,
                                       SimpMessageHeaderAccessor headerAccessor) {
        String msg = HtmlUtils.htmlEscape(incomingMessage.getMessage());
        System.out.println(msg);
        String username = (String) headerAccessor.getSessionAttributes().get("username");
        Optional<User> user = userRepository.findUserByUsername(username);
        if (user.isEmpty()) throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "nem nem nem oké");
        return new OutgoingMessage(msg, new UserResponse(user.get()));
    }


}
