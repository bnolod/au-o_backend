package com.auo.backend.services;

import com.auo.backend.models.GroupEvent;
import com.auo.backend.repositories.EventRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class EventService {
    private final EventRepository eventRepository;

    public List<GroupEvent> getAllEvents() {
        return eventRepository.findAll();
    }
}
