package com.prem.user.dao;

import com.prem.user.model.Address;
import com.prem.user.model.User;
import com.prem.user.utils.AddressRowMapper;
import com.prem.user.utils.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;


import javax.sql.DataSource;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

import static com.prem.user.utils.SqlQuery.*;


public class UserDaoImp implements UserDao{

    @Autowired
    private DataSource dataSource;

    private JdbcTemplate getJdbcTemplate(){
        return new JdbcTemplate(dataSource);
    }
    @Override
    public void save(User user) {


       /* JdbcTemplate jdbcTemplate=new JdbcTemplate(dataSource);
        jdbcTemplate.update(SAVE, user.getFirstName(),user.getLastName(),user.getDob(),user.getUserInterest(),
               user.getMobileNum(),user.getSkills());*/

        KeyHolder keyHolder = new GeneratedKeyHolder();

            getJdbcTemplate().update(connection -> {
                PreparedStatement ps = connection.prepareStatement(
                        "insert into usertbl(firstname, lastname, dob, user_interest, mobile_no, user_skills) values (?,?,?,?,?,?)",
                        Statement.RETURN_GENERATED_KEYS  // ✅ tells DB to return generated key
                );
                ps.setString(1, user.getFirstName());
                ps.setString(2, user.getLastName());
                ps.setDate(3, new Date(user.getDob().getTime()));
                ps.setString(4, user.getUserInterest());
                ps.setLong(5, user.getMobileNum());
                ps.setString(6, user.getSkills());
                return ps;
            }, keyHolder);

           int userId =  keyHolder.getKey().intValue();  // ✅ returns the generated user_id
        Address address= user.getAddress();
        getJdbcTemplate().update(SAVE_ADDRESS,userId, address.getStreetName(), address.getCityName(), address.getCountryName());
    }

    @Override
    public List<User> getAllUsers() {
        List<User> users=getJdbcTemplate().query(LIST_USERS, new UserRowMapper());
        for (User user: users){
            List<Address> address=getJdbcTemplate().query(LIST_ADDRESS_OF_USERS, new AddressRowMapper(), user.getId());
           if(!address.isEmpty()){
                user.setAddress(address.getFirst());
            }
        }
        return users;
    }

    @Override
    public void updateUsersById(int userId, User user) {
        getJdbcTemplate().update(UPDATE_BY_USERID,
                user.getFirstName(),
                user.getLastName(),
                new Date(user.getDob().getTime()),
                user.getUserInterest(),
                user.getMobileNum(),
                user.getSkills(),
                userId
        );
        getJdbcTemplate().update(UPDATE_ADDRESS_BY_ID,
                user.getAddress().getStreetName(),
                user.getAddress().getCityName(),
                user.getAddress().getCountryName(),
                user.getAddress().getId()
        );

    }


    @Override
    public void deleteUser(int id) {
        getJdbcTemplate().update(DELETE_USER_BY_ID, id);
        getJdbcTemplate().update(DELETE_ADDRESS_BY_ID, id);
    }

    @Override
    public User getUserById(int userId, int addressId) {
        User user=getUserId(userId);
        if(user!=null){
            Address address=getAddressId(addressId);
            user.setAddress(address);
        }
        return user;
    }

    @Override
    public User loginUser(String firstName, String lastName) {
        List<User> users=getJdbcTemplate().query(LOGIN_SQL, new UserRowMapper(), firstName, lastName);
        return users.isEmpty() ? null : users.getFirst();
    }

    private User getUserId(int userId){
        List<User> users=getJdbcTemplate().query(GET_BY_USERID, new UserRowMapper(), userId);
        if(!users.isEmpty()){
            return users.getFirst();
        }
        return null;
    }

    private Address getAddressId(int addressId){
        List<Address> addresses=getJdbcTemplate().query(GET_ADDRESS_BY_ID, new AddressRowMapper(), addressId);
        if(!addresses.isEmpty()){
           return addresses.getFirst();
        }
        return null;
    }

}
