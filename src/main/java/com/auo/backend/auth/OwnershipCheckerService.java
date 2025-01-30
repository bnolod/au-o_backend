package com.auo.backend.auth;

import com.auo.backend.models.User;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;

@Service
public class OwnershipCheckerService<U,T> {
    // U -> user class
    // T -> target class, ami tartalmazza az U classt.
    // Valószínű csak akkor működik, ha egy U típusú fieldje van a T-nek DE ha ilyen történik akkor amúgy is hatalmas baj van a kóddal
    // ha valami hiba van ezzel a szarral azonnal szolni nekem

    public boolean isOwnerOf(U user, T target) {
        if (user == null || target == null) {
            throw new NullPointerException();
        }
        try {
            for (Field field : target.getClass().getDeclaredFields()) {
                field.setAccessible(true);
                if (field.getType() == user.getClass()
                        && field.get(target).equals(user) ) {
                    return true;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    public boolean isNotOwnerOf(U user, T target) {
        return !isOwnerOf(user, target);
    }
}
