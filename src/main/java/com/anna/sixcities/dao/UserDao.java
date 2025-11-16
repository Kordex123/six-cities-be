package com.anna.sixcities.dao;

import com.anna.sixcities.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class UserDao {

    private static final String USER_QUERY = """
    SELECT * FROM app_user WHERE login = ?;
    """;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public User getUserByLogin(String login) {
        Map<String, Object> userMap = jdbcTemplate.queryForMap(USER_QUERY, login);
        User user = new User();
        user.setId(((Number) userMap.get("id")).longValue());
        user.setLogin((String) userMap.get("login"));
        user.setPassword((String) userMap.get("password"));
        user.setEmail((String) userMap.get("email"));
        user.setFirstName((String) userMap.get("first_name"));
        user.setLastName((String) userMap.get("last_name"));
        return user;
    }

    public void addUser(User user) {
        jdbcTemplate.update("INSERT INTO app_user (login, password, email, first_name, last_name) VALUES (?, ?, ?, ?, ?)",
                user.getLogin(), user.getPassword(), user.getEmail(), user.getFirstName(), user.getLastName());
    }

    public void deleteUser(Long userId) {
        jdbcTemplate.update("DELETE FROM app_user WHERE id = ?", userId);
    }

    public void updateUser(User user) {
        jdbcTemplate.update("UPDATE app_user SET LOGIN = ?, PASSWORD = ?, EMAIL = ?, FIRSTNAME = ?, LASTNAME = ? WHERE ID = ?",
                user.getLogin(), user.getPassword(), user.getEmail(), user.getFirstName(), user.getLastName(), user.getId());

    }
}
