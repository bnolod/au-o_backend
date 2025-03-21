package com.auo.backend.controllers;

import com.auo.backend.models.GroupMessage;
import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.GroupMessageResponse;
import com.auo.backend.responses.UserResponse;
import com.auo.backend.services.GroupService;
import com.auo.backend.services.UserService;
import com.auo.backend.websocketentity.IncomingMessage;
import com.auo.backend.websocketentity.OutgoingMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.util.HtmlUtils;

import java.security.Principal;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
public class GroupWebSocketController {
    private final UserService userService;
    private final UserRepository userRepository;
    private final GroupService groupService;

    @MessageMapping("/group/{groupId}")
    @SendTo("/topic/group/{groupId}")
    public GroupMessageResponse testMessage(@Payload IncomingMessage incomingMessage,
                                            Principal principal) {

        User user = null;
        if (principal instanceof UsernamePasswordAuthenticationToken auth) {
            user = (User) auth.getPrincipal();
        }
        if (user == null) throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "invalid user");

        GroupMessage savedMessage = groupService.sendMessageToGroup(incomingMessage,user);
        return GroupMessageResponse.ofMessage(savedMessage);
    }


}
