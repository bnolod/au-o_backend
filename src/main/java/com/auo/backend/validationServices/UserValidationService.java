package com.auo.backend.validationServices;

import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.regex.Pattern;

@Service
public class UserValidationService {

    public static boolean patternMatches(String input, String regexPattern) {
        return Pattern.compile(regexPattern)
                .matcher(input)
                .matches();
    }

    public boolean IsEmailValid(String email) {
        String regexPattern = "^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
        return patternMatches(email, regexPattern);
    }
    public boolean IsUsernameValid(String username) {
        String regexPattern = "^(?=.*[a-zA-Z])[a-zA-Z0-9]{3,20}$";
        return patternMatches(username,regexPattern);
    }
    public boolean IsPasswordValid(String password) {
        String regexPattern ="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,64}$";
        return patternMatches(password,regexPattern)
;    }
    public boolean IsDateOfBirthValid(LocalDate dateofbirth) {
        return dateofbirth.isBefore(LocalDate.now().minusYears(16));
    }
    public boolean IsNicknameValid(String nickname) {
        String regexPattern = "^(?=.*[a-zA-Z])[a-zA-Z0-9]{3,20}$";
        return patternMatches(nickname,regexPattern);
    }
    public boolean IsBioValid(String bio) {
        String regexPattern = "^.{0,100}$";
        return patternMatches(bio, regexPattern);
    }

}
