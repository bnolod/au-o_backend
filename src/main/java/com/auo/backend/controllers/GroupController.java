package com.auo.backend.controllers;

import com.auo.backend.models.Group;
import com.auo.backend.services.GroupService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
