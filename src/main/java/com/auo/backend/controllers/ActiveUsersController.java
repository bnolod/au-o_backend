package com.auo.backend.controllers;

import com.auo.backend.models.User;
import com.auo.backend.repositories.PrivateMessageRepository;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.LatestMessageResponse;
import com.auo.backend.responses.UserResponse;
import com.auo.backend.utils.UserUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.user.SimpUser;
import org.springframework.messaging.simp.user.SimpUserRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.messaging.SessionConnectedEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Controller
@RestController
@RequestMapping("/api/v1/public/activeusers")
public class ActiveUsersController {
    private final SimpMessagingTemplate messagingTemplate;
    private final SimpUserRegistry userRegistry;
    private final UserRepository userRepository;
    private final PrivateMessageRepository pmRepository;
    private final UserUtils userUtils;

    public Set<String> activeUsersSet() {
        System.out.println(userRegistry.getUsers().stream().toList());
        return userRegistry.getUsers().stream()
                .map(SimpUser::getName) // Extract usernames
                .collect(Collectors.toSet());
    }

    @GetMapping("/all")
    public List<UserResponse> getActiveUsers() {
        return userRepository.findAllByUsernameIn(activeUsersSet()).stream().map(UserResponse::new).toList();
    }

    @GetMapping("/messagelist")
    public List<LatestMessageResponse> getMessagesList() {
        System.out.println("meghivva");
        User user = userUtils.getCurrentUser();
        return pmRepository.getLatestMessagesWithAllUsersMessagedWith(user.getId()).stream().map(message ->{
            User msguser;
            if (!Objects.equals(message.getSender().getUsername(), user.getUsername())) {
                msguser = message.getSender();
            } else {
                msguser = message.getRecipient();
            }
            System.out.println(msguser + ": " + message.getMessage());
            return new LatestMessageResponse(msguser, message,activeUsersSet().contains(msguser.getUsername()) );
                }).toList();

    }

    private void broadcastActiveUsers() {
        messagingTemplate.convertAndSend("/topic/activeUsers", userRepository.findAllByUsernameIn(activeUsersSet()).stream().map(UserResponse::new).toList());
    }

    @EventListener
    public void handleWebSocketConnectListener(SessionConnectedEvent event) {
        broadcastActiveUsers();
    }

    @EventListener
    public void handleWebSocketDisconnectListener(SessionDisconnectEvent event) {
        broadcastActiveUsers();
    }
}
