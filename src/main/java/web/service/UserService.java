package web.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import web.model.User;
import java.util.List;

public interface UserService extends UserDetailsService {
    List<User> getAllUser();
    boolean validateUser(String name, String password);
    User getUserById(Long id);
    User getUserByName(String name);
    void addUser(User user);
    void deleteUser(Long id);
    void updateUser(User user);
}