package com.anna.sixcities.controller;

import com.anna.sixcities.model.User;
import com.anna.sixcities.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins="http://localhost:5173")
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/search")
    public List<User> searchUser(@RequestBody User user) {
        return userService.searchUsers();
    }

    @GetMapping("/{login}")
    public User getUser(@PathVariable String login) {
        return userService.getUserByLogin(login);
    }

    @PostMapping
    public User addUser(@RequestBody User user) {
        userService.addUser(user);
        return user;
    }

    @DeleteMapping("/{userId}")
    public User deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        return new User();
    }
}
