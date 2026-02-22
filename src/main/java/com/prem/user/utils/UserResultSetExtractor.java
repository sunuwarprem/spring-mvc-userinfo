package com.prem.user.utils;

import com.prem.user.model.User;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserResultSetExtractor implements ResultSetExtractor<User> {

    @Override
    public User extractData(ResultSet rs) throws SQLException, DataAccessException {
        User user=new User();
        user.setId(rs.getInt("id"));
        user.setFirstName(rs.getString("firstname"));
        user.setLastName(rs.getString("lastname"));
        user.setDob(rs.getDate("dob"));
        user.setUserInterest(rs.getString("user_interest"));
        user.setMobileNum(rs.getLong("mobile_no"));
        user.setSkills(rs.getString("user_skills"));
        return user;
    }
}
