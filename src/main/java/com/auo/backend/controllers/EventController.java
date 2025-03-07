package com.auo.backend.controllers;

import com.auo.backend.responses.EventResponse;
import com.auo.backend.services.EventService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("api/v1/events")
public class EventController {

    private final EventService eventService;
    @GetMapping("/all")
    public List<EventResponse> getAllEvents() {
        return eventService.getAllEvents().stream().map(group -> new EventResponse()).toList();
    }
}
