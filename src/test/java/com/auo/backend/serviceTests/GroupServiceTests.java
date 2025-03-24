package com.auo.backend.serviceTests;

import com.auo.backend.dto.create.CreateGroupDto;
import com.auo.backend.enums.GroupRole;
import com.auo.backend.models.Group;
import com.auo.backend.models.GroupMember;
import com.auo.backend.models.Post;
import com.auo.backend.models.User;
import com.auo.backend.repositories.GroupMemberRepository;
import com.auo.backend.repositories.GroupMessageRepository;
import com.auo.backend.repositories.GroupRepository;
import com.auo.backend.repositories.PostRepository;
import com.auo.backend.services.GroupService;
import com.auo.backend.services.UserService;
import com.auo.backend.services.VehicleService;
import com.auo.backend.utils.UserUtils;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.lenient;


@ExtendWith(MockitoExtension.class)
public class GroupServiceTests {

    @Mock
    private  GroupRepository groupRepository;
    @Mock
    private  GroupMemberRepository groupMemberRepository;
    @Mock
    private  UserService userService;
    @Mock
    private  PostRepository postRepository;
    @Mock
    private  VehicleService vehicleService;
    @Mock
    private  UserUtils userUtils;
    @Mock
    private  GroupMessageRepository groupMessageRepository;

    @InjectMocks
    private GroupService groupService;

     User testUser;
     User secondaryTestUser;
     Group testGroup;
     GroupMember testGroupMember;


    @BeforeEach
    void setup() {
        testUser = new User();
        testUser.setUsername("testUsername");
        testUser.setNickname("testNickname");
        testUser.setId(1L);
        testUser.setDeleted(false);
        testUser.setEmail("teszt@gmail.com");
        testUser.setFollowing(new ArrayList<>());
        testUser.setPosts(new ArrayList<>());
        testUser.setFavoritePosts(new ArrayList<>());
        testUser.setGroups(new ArrayList<>());

        secondaryTestUser = new User();
        secondaryTestUser.setUsername("testUsername2");
        secondaryTestUser.setNickname("testNickname2");
        secondaryTestUser.setId(2L);
        secondaryTestUser.setDeleted(false);
        secondaryTestUser.setEmail("teszt2@gmail.com");
        secondaryTestUser.setFollowing(new ArrayList<>());
        secondaryTestUser.setPosts(new ArrayList<>());
        testUser.setGroups(new ArrayList<>());


        testGroup = new Group();
        testGroup.setGroupAlias("TEST");
        testGroup.setGroupDescription("test description");
        testGroup.setGroupMessages(new ArrayList<>());
        testGroup.setGroupName("test group");
        testGroup.setId(1L);
        testGroup.setCreationDate(LocalDateTime.now());
        testGroup.setPublic(true);

        testGroupMember = new GroupMember();
        testGroupMember.setGroupRole(GroupRole.ADMIN);
        testGroupMember.setGroup(testGroup);
        testGroupMember.setValid(true);
        testGroupMember.setId(1L);
        testGroupMember.setUser(testUser);
        testGroupMember.setJoinedDate(LocalDateTime.now());

        testUser.setGroups(List.of(testGroupMember));
        testGroup.setGroupMembers(List.of(testGroupMember));

        lenient().when(groupRepository.findById(1L)).thenReturn(Optional.of(testGroup));

        lenient().when(groupRepository.save(any())).thenAnswer(invocation -> {
            Group group = invocation.getArgument(0);
            group.setId(2L);
            return group;
        });
    }


    @Test
    @DisplayName("Should return true when user is member of a group")
    void should_return_true_when_user_is_member_of_a_group() {
        assertTrue(groupService.isUserInGroup(testUser,testGroup));
    }

    @Test
    @DisplayName("Should return false when user is not a member of a group")
    void should_return_false_when_user_is_not_a_member_of_a_group() {
        assertFalse(groupService.isUserInGroup(secondaryTestUser,testGroup));
    }

    @Test
    @DisplayName("Should return true when user has required role in group")
    void should_return_true_when_user_has_required_role_in_group() {
        assertTrue(groupService.hasRequiredRoleInGroup(testUser,testGroup,List.of(GroupRole.ADMIN)));
    }

    @Test
    @DisplayName("Should create group successfully")
    void should_create_group_successfully() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        CreateGroupDto dto = new CreateGroupDto();
        dto.setPublic(true);
        dto.setName("Test name");
        dto.setDescription("Test description");
        dto.setBannerImage("https://example.com/test.png");

        var result = groupService.createGroup(dto);

        assertNotNull(result);
    }



}
