package com.auo.backend.responses;

import com.auo.backend.models.GroupEvent;
import com.auo.backend.models.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EventResponse {

    private Long eventId;
    private String title;
    private String description;
    private String location;
    private GroupResponse group;
    private Integer attendeeCount;

    public EventResponse(GroupEvent event, User user, Integer attendeeCount) {
        this.eventId = event.getId();
        this.title = event.getTitle();
        this.description = event.getDescription();
        this.location = event.getLocation();
        this.group = new GroupResponse(event.getGroup(), user);
        this.attendeeCount = attendeeCount;
    }

}
