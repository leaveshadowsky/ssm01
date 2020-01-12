package com.jxau.service.impl;

import com.jxau.dao.AdminDao;
import com.jxau.model.Admin;
import com.jxau.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: leaveye
 */

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminDao adminDao;

    @Override
    public Admin adminLogin(Admin admin) {
        return adminDao.adminLogin(admin);
    }

    @Override
    public int adminChangePassword(Admin admin) {
        return adminDao.adminChangePassword(admin);
    }
}
