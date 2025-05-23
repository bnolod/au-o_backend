package com.auo.backend.controllers;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.dto.create.CreateGroupDto;
import com.auo.backend.dto.create.CreatePostDto;
import com.auo.backend.enums.GroupRole;
import com.auo.backend.models.Group;
import com.auo.backend.models.User;
import com.auo.backend.responses.*;
import com.auo.backend.services.GroupService;
import com.auo.backend.services.UserService;
import com.auo.backend.utils.UserUtils;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping(path = "api/v1/groups")
public class GroupController {
    private final GroupService groupService;
    private final UserUtils userUtils;
    @Operation(summary = "Get all groups", description = "dev only.")
    @GetMapping("/all")
    public List<GroupResponse> getAllGroups() {
        return groupService.getAllGroups().stream().map(group -> new GroupResponse(group, userUtils.getCurrentUser())).toList();
    }

    @Operation(summary = "Create a group",
                description = "Creates a group with the owner being the user that created it. Returns the group.")
    @PostMapping("/group")
    public ResponseEntity<GroupResponse> createGroup(
                                                     @Valid @RequestBody CreateGroupDto createGroupDto) {
        return ResponseEntity.ok(groupService.createGroup( createGroupDto));
    }

    @Operation(summary = "Delete group by id", description = "Deletes a group by id if the user has permission.")
    @DeleteMapping("/group/{groupId}")
    public void deleteGroup(@PathVariable Long groupId) {
        groupService.deleteGroup( groupId);
    }

    @Operation(summary = "Get a group by id", description = "Returns a group if it exists.")
    @GetMapping("/group/{groupId}")
    public ResponseEntity<GroupResponse> getGroupById(@PathVariable Long groupId) {
        return ResponseEntity.ok(groupService.getGroupById(groupId));
    }

    @Operation(summary = "Get own groups", description = "Returns all groups where the user is a member.")
    @GetMapping("/own")
    public ResponseEntity<List<GroupResponse>> getOwnGroups() {
        return ResponseEntity.ok(groupService.getOwnGroups());
    }
    @Operation(summary = "Get own groups", description = "Returns all groups where the user is a member.")
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<GroupResponse>> getAllGroupsOfUser(@PathVariable Long userId) {
        System.out.println(userId + "csoportjai");
        return ResponseEntity.ok(groupService.getAllGroupsOfUser(userId));
    }

    @Operation(summary = "Join a group by id", description = "Joins or request to join a group, returns the member data.")
    @PostMapping("/group/{groupId}/join")
    public ResponseEntity<GroupMemberResponse> joinGroup(@PathVariable Long groupId) {
        return ResponseEntity.ok(groupService.joinGroup(groupId));
    }

    @Operation(summary = "Get your member status", description = "Gets your member data from a group")
    @GetMapping("/group/{groupId}/status")
    public ResponseEntity<GroupMemberResponse> getOwnGroupMemberStatus(@PathVariable Long groupId) {
        return ResponseEntity.ok(groupService.getOwnGroupMemberStatus(groupId));
    }

    @PostMapping("/handleJoinRequest/{groupId}/{userId}/{accept}")
    public ResponseEntity<Boolean> handleJoinRequest(@PathVariable Long groupId,
                                                     @PathVariable Long userId,
                                                     @PathVariable boolean accept) {
        return ResponseEntity.ok(groupService.handleJoinRequest(userId,groupId, accept));
    }



    @Operation(summary = "Leave a group by id", description = "Returns ok if successful")
    @PostMapping("/group/{groupId}/leave")
    public void leaveGroup(@PathVariable Long groupId) {
        this.groupService.leaveGroup(groupId);
    }
    //
    // edit group
    //


    // modify members roles
    @Operation(summary = "Modify member's role in group by id", description = "Modififies the role of a groupmember if user has permission")
    @PutMapping("/group/{groupId}/{userId}")
    public ResponseEntity<GroupMemberResponse> setRoleOfMember(@PathVariable Long groupId,
                                                               @PathVariable Long userId,
                                                               @Valid @RequestBody GroupRole groupRole) {
        return ResponseEntity.ok(groupService.setRoleOfMember(userId,groupId,groupRole));
    }

    @Operation(summary = "Update group by id", description = "Updates a group by id if the user has permission.")
    @PutMapping("/group/{groupId}")
    public ResponseEntity<GroupResponse> updateGroup(
            @PathVariable Long groupId,
            @Valid @RequestBody CreateGroupDto createGroupDto) {
        return ResponseEntity.ok(groupService.updateGroup(groupId, createGroupDto));
    }

    
    //
    // post to group
    @Operation(summary = "Publish post to group by id", description = "Creates a post to a group if user has permission and is part of group.")
    @PostMapping("/group/{groupId}/post")
    public ResponseEntity<PostResponse> publishPostToGroup(@PathVariable Long groupId,
                                                           @Valid @RequestBody CreatePostDto createPostDto
                                                           ) {
        return ResponseEntity.ok(groupService.addPostToGroup(groupId, createPostDto));
    }
    //
    // event...
    //
    //

    @GetMapping("/group/{groupId}/posts")
    public ResponseEntity<List<PostResponse>> getPostsByGroupId (@PathVariable Long groupId) {
        return ResponseEntity.ok(groupService.getPostsByGroupId(groupId));
    }
    @GetMapping("/group/{groupId}/members")
    public ResponseEntity<GroupMemberListResponse> getMembersByGroupId (@PathVariable Long groupId) {
        User user = userUtils.getCurrentUser();
        return ResponseEntity.ok(groupService.getGroupMembersByGroupId(user, groupId));
    }
    @GetMapping("/group/{groupId}/messages")
    public ResponseEntity<List<GroupMessageResponse>> getMessagesOfGroup(@PathVariable Long groupId) {
        return ResponseEntity.ok(groupService.getMessagesOfGroup(groupId));
    }

    @GetMapping("/group/{groupId}/pending")
    public ResponseEntity<List<GroupMemberResponse>> getPendingMembers(@PathVariable Long groupId) {
        return ResponseEntity.ok(groupService.getPendingMembers(groupId));
    }

}
