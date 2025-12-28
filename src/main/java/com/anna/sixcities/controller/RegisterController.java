package com.anna.sixcities.controller;

import com.anna.sixcities.model.User;
import com.anna.sixcities.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins="http://localhost:5173")
@RestController
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private UserService userService;

    @PostMapping
    public User registerUser(@RequestBody User user) {
        userService.addUser(user);
        return user;
    }
}


