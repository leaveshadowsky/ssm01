package com.jxau.controller;

import com.jxau.model.Admin;
import com.jxau.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author: leaveye
 */

@Controller
@SessionAttributes(value = "admin1")
@RequestMapping("/adminManager")
public class AdminController {
    @Autowired
    AdminService adminService;
    @RequestMapping("/adminLogin")
    public String adminLogin(Admin admin,Model model){
        Admin admin1 = adminService.adminLogin(admin);
        if(admin1 != null){
            model.addAttribute("admin1",admin1);
            return "index";
        }
        return "redirect:/admin/login.jsp";

    }

    @RequestMapping("/adminLogout")
    public String adminLogout(HttpServletRequest request){

        //获取session对象
        HttpSession session=request.getSession();
        session.invalidate();
        return "redirect:/admin/login.jsp";

    }

    @RequestMapping("/adminChangePassword")
    public String AdminChangePassword(HttpServletRequest request,String password){
        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("admin1");
        admin.setPassword(password);
        int result = adminService.adminChangePassword(admin);
        return "index";
    }
}
