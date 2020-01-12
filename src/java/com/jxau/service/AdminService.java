package com.jxau.service;

import com.jxau.model.Admin;

/**
 * @author: leaveye
 */
public interface AdminService {

    Admin adminLogin(Admin admin);

    int  adminChangePassword(Admin admin);

}
