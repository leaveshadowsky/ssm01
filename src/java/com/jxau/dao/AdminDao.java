package com.jxau.dao;

import com.jxau.model.Admin;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

/**
 * @author: leaveye
 */
@Repository
public interface AdminDao {
    @Select("select * from admin where userName = #{userName} and password = #{password}")
    Admin adminLogin(Admin admin);

    @Update("update admin set password = #{password} where id=#{id}")
    int adminChangePassword(Admin admin);

}
