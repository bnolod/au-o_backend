package com.auo.backend.responses;

import com.auo.backend.models.GroupEvent;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EventAttendeeResponse {
    private Long eventId;
    private UserResponse user;
    private VehicleResponse vehicle;

    public EventAttendeeResponse(GroupEvent event, UserResponse user, VehicleResponse vehicle) {
        this.eventId = eventId;
    }
}
