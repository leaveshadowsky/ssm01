package com.jxau.dao;

import com.jxau.model.Admin;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author: leaveye
 */
@Repository
public interface AdminDao {
    @Select("select * from admin where userName = #{userName} and password = #{password}")
    Admin adminLogin(Admin admin);
}
