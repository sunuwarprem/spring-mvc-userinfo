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
    public static final String UPDATE_BY_USERID= """
            UPDATE usertbl SET firstname=?, lastname=?, dob=?, user_interest=?,
            mobile_no=?, user_skills=? WHERE id=?
       """;
    public static final String UPDATE_ADDRESS_BY_ID= """
       UPDATE addresstbl SET streetname=?, cityname=?, countryname=?
       WHERE userid=?
    """;
    public static final String GET_BY_USERID= """
      select *  from usertbl where id=?
      """;
    public static final String GET_ADDRESS_BY_ID= """
       select * from addresstbl where id=?
    """;
    public static final String DELETE_ADDRESS_BY_ID= """
       delete from addresstbl where userid=?
    """;
    public static final String DELETE_USER_BY_ID= """
       delete from usertbl where id=?
    """;
    public static final String LOGIN_SQL= """
       SELECT * FROM usertbl WHERE firstName = ? AND lastName = ?
       """;

}
