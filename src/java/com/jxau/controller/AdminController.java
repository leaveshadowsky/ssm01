package com.jxau.controller;

import com.jxau.model.Admin;
import com.jxau.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author: leaveye
 */

@Controller
@SessionAttributes(types = Admin.class)
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;
    @RequestMapping("/adminLogin")
    public String adminLogin(Admin admin,Model model){
        Admin admin1 = adminService.adminLogin(admin);
        model.addAttribute(admin1);
        return "index";
    }
}
