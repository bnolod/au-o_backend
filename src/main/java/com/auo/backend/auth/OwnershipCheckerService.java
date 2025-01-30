package com.auo.backend.auth;

import com.auo.backend.models.User;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;

/**
* @param <U> -> user class
* @param <T> -> target class, (ami valószínű tartalmazza az U classt).
*           <p>
*
* ha valami hiba van ezzel a szarral azonnal szolni nekem
*/
@Service
public class OwnershipCheckerService<U,T> {

    /**
     *
     * @param user a felhasználó, aki küldi a requestet
     * @param target egy felhasználó által generált bármilyen típusú osztály, TARTALMAZNIA KELL PONTOSAN EGY U típusú fieldet
     * @return true/false
     */
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
