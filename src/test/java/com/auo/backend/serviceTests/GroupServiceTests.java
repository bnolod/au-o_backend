package com.auo.backend.serviceTests;

import com.auo.backend.dto.create.CreateGroupDto;
import com.auo.backend.enums.GroupRole;
import com.auo.backend.models.Group;
import com.auo.backend.models.GroupMember;
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
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;


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

        lenient().when(groupMemberRepository.save(any())).thenAnswer(invocation -> {
            GroupMember member = invocation.getArgument(0);
            member.setId(2L);
            return member;
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

    @Test
    @DisplayName("Should generate alias fron group name when group name contains uppercase letters")
    void should_generate_alias_fron_group_name_when_group_name_contains_uppercase_letters() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        CreateGroupDto dto = new CreateGroupDto();
        dto.setPublic(true);
        dto.setName("Test Est St T group");
        dto.setDescription("Test description");
        dto.setBannerImage("https://example.com/test.png");

        var result = groupService.createGroup(dto);

        assertEquals("TEST",result.getAlias());
    }

    @Test
    @DisplayName("Should generate alias from groups name when it does not contain uppercase letters")
    void should_generate_alias_from_groups_name_when_it_does_not_contain_uppercase_letters() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        CreateGroupDto dto = new CreateGroupDto();
        dto.setPublic(true);
        dto.setName("test group");
        dto.setDescription("Test description");
        dto.setBannerImage("https://example.com/test.png");

        var result = groupService.createGroup(dto);
        assertEquals("test g",result.getAlias());
    }

    @Test
    @DisplayName("Should throw error when already member of group")
    void should_throw_error_when_already_member_of_group() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);

        var res = assertThrows(ResponseStatusException.class,()-> {
            groupService.joinGroup(1L);
        });

        assertEquals(HttpStatus.CONFLICT,res.getStatusCode());
    }

    @Test
    @DisplayName("Should successfully join group when not member of group")
    void should_successfully_join_group_when_not_member_of_group() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(secondaryTestUser);
        assertNotNull(groupService.joinGroup(1L));
    }

    @Test
    @DisplayName("Should throw exception when trying to leave group when user is the only admin")
    void should_throw_exception_when_trying_to_leave_group_when_user_is_the_only_admin() {
        lenient().when(userUtils.getCurrentUser()).thenReturn(testUser);
        lenient().when(groupMemberRepository.getByUserAndGroup(testUser, testGroup)).thenReturn(Optional.ofNullable(testGroupMember));

        var result = assertThrows(ResponseStatusException.class,()-> {
            groupService.leaveGroup(1l);
        });
        assertEquals(HttpStatus.CONFLICT,result.getStatusCode());
    }

    @Test
    @DisplayName("Should successfully delete group when user is admin")
    void should_successfully_delete_group_when_user_is_admin() {
        when(userUtils.getCurrentUser()).thenReturn(testUser);
        lenient().when(groupMemberRepository.getByUserAndGroup(testUser,testGroup)).thenReturn(Optional.ofNullable(testGroupMember));

        groupService.deleteGroup(1L);

        verify(groupRepository, times(1)).delete(testGroup);
    }

    @Test
    @DisplayName("Should throw error when trying to delete group without admin role")
    void should_throw_error_when_trying_to_delete_group_without_admin_role() {
        when(userUtils.getCurrentUser()).thenReturn(testUser);
        testGroupMember.setGroupRole(GroupRole.MEMBER);
        lenient().when(groupMemberRepository.getByUserAndGroup(testUser,testGroup)).thenReturn(Optional.ofNullable(testGroupMember));

        var result = assertThrows(ResponseStatusException.class,() ->
            groupService.deleteGroup(1L)
        );
        assertEquals(HttpStatus.UNAUTHORIZED,result.getStatusCode());
    }





}
