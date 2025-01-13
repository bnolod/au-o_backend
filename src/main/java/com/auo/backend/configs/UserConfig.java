package com.auo.backend.configs;

import com.auo.backend.repositories.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UserConfig {

    @Bean
    CommandLineRunner commandLineRunner (
            UserRepository userRepository
    ) {
        return args -> {

        };
    }
}
