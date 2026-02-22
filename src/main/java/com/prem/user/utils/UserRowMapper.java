package com.prem.user.utils;

import com.prem.user.model.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {

        UserResultSetExtractor resultSetExtractor=new UserResultSetExtractor();
        return resultSetExtractor.extractData(rs);
    }
}
