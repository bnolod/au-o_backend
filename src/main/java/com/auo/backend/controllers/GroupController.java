package com.auo.backend.controllers;

import com.auo.backend.dto.CreateGroupDto;
import com.auo.backend.dto.CreatePostDto;
import com.auo.backend.enums.GroupRole;
import com.auo.backend.models.Group;
import com.auo.backend.responses.GroupMemberResponse;
import com.auo.backend.responses.GroupResponse;
import com.auo.backend.responses.PostResponse;
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
    @PostMapping("/group/{groupId}/join")
    public ResponseEntity<GroupMemberResponse> joinGroup(@RequestHeader(HttpHeaders.AUTHORIZATION)String token,
                                                         @PathVariable Long groupId) {
        return ResponseEntity.ok(groupService.joinGroup(token,groupId));
    }


    //
    // leave group
    @PostMapping("/group/{groupId}/leave")
    public void leaveGroup(@RequestHeader(HttpHeaders.AUTHORIZATION) String token,
                           @PathVariable Long groupId) {
        this.groupService.leaveGroup(token,groupId);
    }
    //
    // edit group
    //


    // modify members roles
    @PutMapping("/group/{groupId}/{userId}")
    public ResponseEntity<GroupMemberResponse> setRoleOfMember(@RequestHeader(HttpHeaders.AUTHORIZATION) String token,
                                                               @PathVariable Long groupId,
                                                               @PathVariable Long userId,
                                                               @RequestBody GroupRole groupRole) {
        return ResponseEntity.ok(groupService.setRoleOfMember(token,userId,groupId,groupRole));
    }

    
    //
    // post to group
    @PostMapping("/group/{groupId}/post")
    public ResponseEntity<PostResponse> publishPostToGroup(@RequestHeader(HttpHeaders.AUTHORIZATION) String token,
                                                           @PathVariable Long groupId,
                                                           @RequestBody CreatePostDto createPostDto
                                                           ) {
        return ResponseEntity.ok(groupService.addPostToGroup(token,groupId, createPostDto));
    }
    //
    // event...
    //
    //

}
