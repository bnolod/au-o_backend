package com.auo.backend.validationServices;

import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class UserValidationService {

    public boolean IsEmailValid(String email) {
        return true;
    }
    public boolean IsUsernameValid(String username) {
        return true;
    }
    public boolean IsPasswordValid(String password) {
        return true;
    }
    public boolean IsDateOfBirthValid(LocalDate dateofbirth) {
        return true;
    }
    public boolean IsNicknameValid(String nickname) {
        return true;
    }
    public boolean IsBioValid() {
        return true;
    }

}
