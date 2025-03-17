package com.auo.backend.repositories;

import com.auo.backend.models.Group;
import com.auo.backend.models.GroupMember;
import com.auo.backend.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GroupMemberRepository extends JpaRepository<GroupMember, Long> {

    Optional<List<GroupMember>> getByUser(User user);
    Optional<GroupMember> getByUserAndGroup(User user, Group group);

    Optional<List<GroupMember>> getGroupMembersByGroup_Id(Long groupId);

    @Query("SELECT gm FROM GroupMember gm WHERE gm.group = :group AND gm.isValid = false")
    List<GroupMember> findInvalidGroupMembers(@Param("group") Group group);
}
