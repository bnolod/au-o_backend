package com.auo.backend;

import com.auo.backend.services.UserService;
import org.springframework.boot.jdbc.EmbeddedDatabaseConnection;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;


@AutoConfigureTestDatabase(connection = EmbeddedDatabaseConnection.H2)
@WebMvcTest
public class UserControllerTest {
    @MockitoBean
    UserService
}
