package com.prem.user.service;

import com.prem.user.dao.UserDao;
import com.prem.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserServiceImp implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void save(User user) {
        userDao.save(user);
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    public void updateUsersById(int userId, User user) {
        userDao.updateUsersById(userId, user);
    }

    @Override
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

    @Override
    public User getUserById(int userId, int addressId) {
        return userDao.getUserById(userId, addressId);
    }


}
