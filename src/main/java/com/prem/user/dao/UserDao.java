package com.prem.user.dao;

import com.prem.user.model.User;

import java.util.List;

public interface UserDao {

    public void save(User user);

    public List<User> getAllUsers();
}
