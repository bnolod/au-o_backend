package com.auo.backend.repositories;

import com.auo.backend.models.Group;
import com.auo.backend.models.GroupMember;
import com.auo.backend.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface GroupRepository extends JpaRepository<Group, UUID> {
    List<Group> findByGroupDescriptionContainingOrGroupAliasContainingOrGroupNameContaining (String string1, String string2, String string3);


    //felhasználó idje alapján csoportok keresése:
//    List<Group> findByMembers_userId(Long userid);

}
