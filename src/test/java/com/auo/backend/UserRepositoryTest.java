package com.auo.backend;

import com.auo.backend.models.User;
import com.auo.backend.repositories.UserRepository;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.EmbeddedDatabaseConnection;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.time.LocalDateTime;

@DataJpaTest(showSql = false)
@AutoConfigureTestDatabase(connection = EmbeddedDatabaseConnection.H2)
public class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @BeforeEach
    public void setup() {
        User user = User.builder()
                .username("felhnev123")
                .email("teszt123@email.hu")
                .password("jelszo")
                .bio("bio")
                .nickname("hello")
                .dateOfBirth(LocalDateTime.now().toLocalDate())
                .profileImg("a.png")
                .build();

        userRepository.save(user);
    }


    @Test
    public void UserRepositorySaveNewUserShouldNotContainNullValues() {
        User user = User.builder()
                .username("felhnev")
                .email("teszt@email.hu")
                .password("jelszo")
                .bio("bio")
                .nickname("hello")
                .dateOfBirth(LocalDateTime.now().toLocalDate())
                .profileImg("a.png")
                .build();

        User savedUser = userRepository.save(user);


        Assertions.assertThat(savedUser).isNotNull();
        Assertions.assertThat(savedUser.getComments()).isNotNull();
        Assertions.assertThat(savedUser.getDateOfSignup()).isNotNull();
        Assertions.assertThat(savedUser.getFollowing()).isNotNull();
        Assertions.assertThat(savedUser.getPosts()).isNotNull();
        Assertions.assertThat(savedUser.getReactions()).isNotNull();
        Assertions.assertThat(savedUser.getReplies()).isNotNull();
        Assertions.assertThat(savedUser.getId()).isGreaterThan(0L);
    }

    @Test()
    public void UserWithUsernameConflictShouldThrowError() {
        User user = User.builder()
                .username("felhnev")
                .email("teszt@email.hu")
                .password("jelszo")
                .bio("bio")
                .nickname("hello")
                .dateOfBirth(LocalDateTime.now().toLocalDate())
                .profileImg("a.png")
                .build();

        User savedUser = userRepository.save(user);
    }
    
}
