package com.prem.user.utils;

import com.prem.user.model.Address;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AddressRowMapper implements RowMapper<Address> {
    @Override
    public Address mapRow(ResultSet rs, int rowNum) throws SQLException {
        Address address=new Address();
        address.setId(rs.getInt("id"));
        address.setUserid(rs.getInt("userid"));
        address.setStreetName(rs.getString("streetname"));
        address.setCityName(rs.getString("cityname"));
        address.setCountryName(rs.getString("countryname"));
        return address;
    }
}
