package com.anna.sixcities.security;

import com.anna.sixcities.dao.UserDao;
import com.anna.sixcities.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String email)
            throws UsernameNotFoundException {

        User user = userDao.getUserByEmail(email);
        if ( user == null) {
            throw new UsernameNotFoundException("User not found: " + email);
        }

        return org.springframework.security.core.userdetails.User
                .withUsername(user.getEmail())
                .password(user.getPassword())
                .roles("CLIENT") // domyślna rola dla wszystkich użytkowników
                .build();
    }
}

