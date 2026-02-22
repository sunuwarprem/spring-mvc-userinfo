package com.prem.user.service;

import com.prem.user.model.User;

import java.util.List;

public interface UserService {
    public void save(User user);

    public List<User> getAllUsers();
}
