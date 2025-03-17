package com.auo.backend.controllers;

import com.auo.backend.message.incoming.TargetedMessage;
import com.auo.backend.message.outgoing.PrivateMessageResponse;
import com.auo.backend.models.PrivateMessage;
import com.auo.backend.models.User;
import com.auo.backend.repositories.PrivateMessageRepository;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.responses.LatestMessageResponse;
import com.auo.backend.utils.UserUtils;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/messages")
public class PrivateMessagingController {
    private final UserRepository userRepository;
    private final UserUtils userUtils;
    private final SimpMessagingTemplate messagingTemplate;
    private final PrivateMessageRepository pmRepository;
    private final ActiveUsersController activeUsersController;

    // A 3D map: <username, <friendUsername, List<ChatMessage>>>
//    protected ConcurrentHashMap<String, ConcurrentHashMap<String, List<ChatMessage>>> userToMessagesMap = new ConcurrentHashMap<>();

    @GetMapping("/user/{username}")
    public List<PrivateMessageResponse> getMessagesWithUser(@PathVariable String username) {
        User user = userUtils.getCurrentUser();
        var targetUser = userRepository.findUserByUsername(username);
        if (targetUser.isEmpty()) return null;

        List<PrivateMessage> friendMessages = pmRepository.getBySenderIdAndRecipientId(user.getId(),targetUser.get().getId());
        if (friendMessages == null) {
            return new ArrayList<>();  // Return empty list if no messages with the specific friend
        }

        var responselist = friendMessages.stream().map(PrivateMessageResponse::new).toList();
        responselist.forEach(item -> {
            System.out.println("messageobj: " + item.getUser().getUsername() + ": " + item.getMessage());
        });
        return responselist;
    }

    @MessageMapping("/chat/user/")
    @Transactional
    public void sendMessageToUser(Principal principal, @Payload @Valid TargetedMessage message) {
        User user = null;
        if (principal instanceof UsernamePasswordAuthenticationToken auth) {
            user = (User) auth.getPrincipal();
        }
        assert user != null;
        user = userRepository.findUserByUsername(user.getUsername()).orElseThrow();
        User recipient = userRepository.findUserByUsername(message.getUsername()).orElseThrow();
        PrivateMessage privateMessage = PrivateMessage.builder()
                .message(message.getMessage())
                .sender(user)
                .recipient(recipient)
                .build();

        privateMessage = pmRepository.save(privateMessage);
//        // Store the message in the 3D map
//        addMessageToUser(user.getUsername(), message.getUsername(), chatMessage);
//        addMessageToUser(message.getUsername(), user.getUsername(), chatMessage);


        // Spring will automatically handle sending messages to the correct WebSocket destinations for each user
        messagingTemplate.convertAndSendToUser(
                message.getUsername(), "/queue/chat/" + user.getUsername(), new PrivateMessageResponse(privateMessage)
        );
        messagingTemplate.convertAndSendToUser(
                user.getUsername(), "/queue/chat/" + message.getUsername(), new PrivateMessageResponse(privateMessage)
        );
        messagingTemplate.convertAndSendToUser(
                message.getUsername(), "/queue/notifications/", new LatestMessageResponse
                        (user, privateMessage ,activeUsersController.activeUsersSet().contains(message.getUsername())
        ));
        messagingTemplate.convertAndSendToUser(
                user.getUsername(), "/queue/notifications/", new LatestMessageResponse
                        (user, privateMessage ,activeUsersController.activeUsersSet().contains(message.getUsername())
                        ));
        }

//    // Method to add a message to the 3D map
//    public void addMessageToUser(String username, String friendUsername, ChatMessage chatMessage) {
//        // Retrieve the user's messages map (username -> <friendUsername, List<ChatMessage>>)
//        ConcurrentHashMap<String, List<ChatMessage>> userMessages = userToMessagesMap.computeIfAbsent(username, k -> new ConcurrentHashMap<>());
//
//        // Retrieve the messages for the specific friend (friendUsername)
//        List<ChatMessage> friendMessages = userMessages.computeIfAbsent(friendUsername, k -> new CopyOnWriteArrayList<>());
//
//        // Add the new chat message to the friend's list of messages
//        friendMessages.add(chatMessage);
//    }
}
