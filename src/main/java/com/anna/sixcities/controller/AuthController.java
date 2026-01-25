package com.anna.sixcities.controller;

import com.anna.sixcities.model.Review;
import com.anna.sixcities.model.User;
import com.anna.sixcities.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public User login(@RequestBody User user) {
        return userService.login(user);
    }

}

