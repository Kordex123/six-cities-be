package com.anna.sixcities.service;

import com.anna.sixcities.dao.OfferDao;
import com.anna.sixcities.dao.UserDao;
import com.anna.sixcities.model.Offer;
import com.anna.sixcities.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public User getUserByLogin(String login) {
        return userDao.getUserByLogin(login);
    }

    public void addUser(User user) {
        userDao.addUser(user);
    }

    public void deleteUser(Long userId) {
        userDao.deleteUser(userId);
    }

    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    public User login(User user) {
        if (user == null || user.getEmail() == null || user.getPassword() == null) {
            throw new IllegalArgumentException("Empty email or password");
        }
        User dbUser = userDao.getUserByEmail(user.getEmail());
        if (dbUser != null && dbUser.getPassword().equals(user.getPassword())) {
            return dbUser;
        } else {
            throw new IllegalArgumentException("Wrong email or password");
        }
    }
}
