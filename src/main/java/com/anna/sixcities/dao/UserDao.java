package com.anna.sixcities.dao;

import com.anna.sixcities.model.Review;
import com.anna.sixcities.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class UserDao {

    private static final String USER_QUERY = """
    SELECT * FROM app_user WHERE login = ?
    """;

    private static final String PERMISSION_QUERY = """
    SELECT * FROM permission
    JOIN user_permission ON permission.id = user_permission.permission_id
    WHERE user_id = ?;
    """;

    private static final String USERS_QUERY = """
    SELECT * FROM app_user
    """;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<User> searchUsers() {

        List<Map<String, Object>> userMapList = jdbcTemplate.queryForList(USERS_QUERY);
        List<User> result = userMapList.stream().map(userMap -> {
            User user = new User();
            user.setId(((Number) userMap.get("id")).longValue());
            user.setLogin((String) userMap.get("login"));
            user.setPassword((String) userMap.get("password"));
            user.setFirstName((String) userMap.get("first_name"));
            user.setLastName((String) userMap.get("last_name"));
            user.setEmail((String) userMap.get("email"));
            return user;
        }).toList();
        return result;
    }

    private static User getUser(Map<String, Object> userMap) {
        User user = new User();
        user.setId(((Number) userMap.get("id")).longValue());
        user.setLogin((String) userMap.get("login"));
        user.setPassword((String) userMap.get("password"));
        user.setEmail((String) userMap.get("email"));
        user.setFirstName((String) userMap.get("first_name"));
        user.setLastName((String) userMap.get("last_name"));
        return user;
    }

    public User getUserByLogin(String login) {
        Map<String, Object> userMap = jdbcTemplate.queryForMap(USER_QUERY, login);
        return getUser(userMap);
    }

    public List<String> getPermissionsByUserId(Long userId) {
        List<Map<String, Object>> permissions = jdbcTemplate.queryForList(PERMISSION_QUERY, userId);
        return permissions.stream().map(permission -> (String) permission.get("name")).toList();
    }


    public User getUserByEmail(String email) {
        Map<String, Object> userMap = jdbcTemplate.queryForMap("SELECT * FROM app_user WHERE email = ?", email);
        User user = getUser(userMap);
        user.setPermissions(getPermissionsByUserId(user.getId()));
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
