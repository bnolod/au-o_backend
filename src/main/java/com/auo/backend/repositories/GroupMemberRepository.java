package com.auo.backend.repositories;

import com.auo.backend.models.Group;
import com.auo.backend.models.GroupMember;
import com.auo.backend.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface GroupMemberRepository extends JpaRepository<GroupMember, Long> {

    Optional<List<GroupMember>> getByUser(User user);
    Optional<GroupMember> getByUserAndGroup(User user, Group group);

    Optional<List<GroupMember>> getGroupMembersByGroup_Id(Long groupId);

    List<GroupMember> getGroupMembersByGroupAndValidIsFalse(Group group);
}
