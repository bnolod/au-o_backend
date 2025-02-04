package com.auo.backend.controllers;

import com.auo.backend.dto.CreateGroupDto;
import com.auo.backend.models.Group;
import com.auo.backend.responses.GroupResponse;
import com.auo.backend.services.GroupService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping(path = "api/v1/groups")
public class GroupController {
    private final GroupService groupService;

    @GetMapping("/all")
    public List<Group> getAllGroups() {
        return groupService.getAllGroups();
    }

    //kell:
    // create group

    @PostMapping("/group")
    public ResponseEntity<GroupResponse> createGroup(@RequestHeader(HttpHeaders.AUTHORIZATION)String token,
                                                     @RequestBody CreateGroupDto createGroupDto) {
        return ResponseEntity.ok(groupService.createGroup(token, createGroupDto));
    }

    //
    // delete group
    //
    // join group
    //
    // leave group
    //
    // edit group
    //
    // modify members roles
    //
    // post to group
    //
    // event...
    //
    //

}
