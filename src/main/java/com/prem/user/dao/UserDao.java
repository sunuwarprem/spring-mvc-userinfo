package com.prem.user.dao;

import com.prem.user.model.User;

import java.util.List;

public interface UserDao {

    public void save(User user);

    public List<User> getAllUsers();

    void updateUsersById(int userId, User user);

    void deleteUser(int id);

    User getUserById(int userId, int addressId);
}
