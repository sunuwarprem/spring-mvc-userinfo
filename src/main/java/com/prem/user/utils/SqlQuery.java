package com.prem.user.utils;

public class SqlQuery {

    public static final String SAVE= """
       insert into usertbl(firstname, lastname, dob, user_interest, mobile_no , user_skills)
        values (?,?,?,?,?,?)
    """;
    public static final String SAVE_ADDRESS= """
       insert into addresstbl(userid, streetname, cityname, countryname)
        values (?,?,?,?)
    """;
    public static final String LIST_USERS= """
       select * from usertbl
    """;

    public static final String LIST_ADDRESS_OF_USERS= """
       select * from addresstbl where userid=?
    """;
}
