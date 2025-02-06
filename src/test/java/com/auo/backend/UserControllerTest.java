package com.auo.backend;

import com.auo.backend.auth.AuthenticationService;
import com.auo.backend.dto.UserRegisterDto;
import com.auo.backend.repositories.UserRepository;
import com.auo.backend.services.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.EmbeddedDatabaseConnection;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;


@AutoConfigureTestDatabase(connection = EmbeddedDatabaseConnection.H2)
@WebMvcTest
public class UserControllerTest {
    @MockitoBean
    UserService userService;
    @MockitoBean
    AuthenticationService authenticationService;

    @Autowired
    MockMvc mockMvc;

    @Autowired
    UserRepository userRepository;

    @Test
    public void should

}
