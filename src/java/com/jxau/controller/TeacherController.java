package com.jxau.controller;


import com.jxau.model.Teacher;
import com.jxau.service.TeacherService;
import com.jxau.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/teacher")//定义类级别的
public class TeacherController {

    //通过spring获取对象,调用方法测试
    @Autowired
    TeacherService teacherService;

    //修改教师数据
    @RequestMapping("/updateTeacher")
    public String updateTeacher(Teacher teacher, Model model){
        int result = teacherService.updateTeacher(teacher);
        //Teacher{id=13, name='阿三', password='123', realName='', sex='', age='', tel='', address='', subject='', grade='', identity='null', education='', introduce='', photo='null', teacherStatus='null'}
        if (result > 0){
            return "redirect:/teacher/getAllTeacher";
        }else {
            model.addAttribute("tips","修改失败");
            return "redirect:/teacher/getAllTeacher";
        }
    }

    //增加教师
    @RequestMapping("/teacherAdd")
    public String teacherAdd(Teacher teacher,Model model){
        int result = teacherService.teacherAdd(teacher);
        if (result>0){
            return "redirect:/teacher/getAllTeacher";//redirect:/login.jsp
        }else {
            return "redirect:/teacher/getAllTeacher";//forward:/regist.jsp
        }
    }

    //删除教师
    @RequestMapping("/teacherDelete")
    public String teacherDelete(int id, Model model){
        int result = teacherService.teacherDelete(id);
        if (result>0){
            model.addAttribute("tips","删除成功");
            return "redirect:/teacher/getAllTeacher";
        }else {
            model.addAttribute("tips","删除失败");
            return "redirect:/teacher/getAllTeacher";
        }
    }


    //查看当前id得教师信息,并将该老师信息放到model设置得属性teacher中
    @RequestMapping("/lookCurrentTeacher")
    public String lookCurrentTeacher(int id, Model model,String update){
        Teacher t = teacherService.lookCurrentTeacher(id);
        if(update != null){
            if (t!=null){
                model.addAttribute("teacher",t);
                return "teacherUpdate";
            }else{
                return "redirect:/teacher/getAllTeacher";
            }
        }else {
            model.addAttribute("teacher",t);
            return "teacherView";//返回到一个页面中
        }
    }

    //模糊查询提交之后，提交到该方法
    //模糊查询,将该老师信息放到model设置得属性teachers中，并分页显示
    //模糊查询成功，返回到一个页面
    @RequestMapping(path = "/getAllTeacherBySubjectAddressSex")
    public String getAllTeacherBySubjectAddressSex(String subject, String address, String sex, Model model, HttpServletRequest request, HttpSession session){
        //每提交一次就存到session里面
        session.setAttribute("subject",subject);
        session.setAttribute("address",address);
        session.setAttribute("sex",sex);
        int current;
        String currentPage=request.getParameter("currentPage");
        if(currentPage==null){
            currentPage="1";
        }
        current=Integer.parseInt(currentPage);
        int pageNum = 5;

        Map<String ,Object> map = new HashMap<String ,Object>();
        //map的名字要和sql里面的名字一致
        map.put("subject","%"+session.getAttribute("subject")+"%");
        map.put("address","%"+session.getAttribute("address")+"%");
        map.put("sex","%"+session.getAttribute("sex")+"%");
        int c = (current-1)*pageNum;
        map.put("currentPage",c);
        map.put("pageNum",pageNum);
        List<Teacher> teachers = teacherService.getAllTeacherBySubjectAddressSex(map);

        //模糊查询所得的长度
        int totals = teacherService.getAllTeacherBySubjectAddressSexTotal(map);
        Page page = new Page(current,pageNum);
        page.setResult(teachers,totals);
        model.addAttribute("page",page);

        model.addAttribute("teachers",teachers);
        return "teacherList2";
    }

    //该方法用于解决模糊查询所提交的参数被不断刷新覆盖的问题
    //currentPage参数提交到这个方法中
    @RequestMapping("/getCurrentPage")
    public String getCurrentPage(String currentPage,HttpSession session,Model model){
        int current = Integer.parseInt(currentPage);
        int pageNum = 5;
        int c = (current-1)*pageNum;
        Map<String ,Object> map = new HashMap<String ,Object>();
        //从session里面取值
        map.put("subject","%"+session.getAttribute("subject")+"%");
        map.put("address","%"+session.getAttribute("address")+"%");
        map.put("sex","%"+session.getAttribute("sex")+"%");
        map.put("currentPage",c);
        map.put("pageNum",pageNum);
        List<Teacher> teachers = teacherService.getAllTeacherBySubjectAddressSex(map);
        //模糊查询所得的长度
        int totals = teacherService.getAllTeacherBySubjectAddressSexTotal(map);
        Page page = new Page(current,pageNum);
        page.setResult(teachers,totals);
        model.addAttribute("page",page);

        model.addAttribute("teachers",teachers);
        return "teacherList2";
    }

    //查询所有教师信息显示在教师管理页面
    @RequestMapping("/getAllTeacher")
    public String getAllTeacher(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
        String currentPage=request.getParameter("currentPage");
        if(currentPage==null){
            currentPage="1";
        }
        int current=Integer.parseInt(currentPage);
        int pageNum = 6;
        List<Teacher> teachers = teacherService.getAllTeacher(current,pageNum);

        int totals = teacherService.getTotalTeacher();
        Page page = new Page(current,pageNum);
        page.setResult(teachers,totals);
        model.addAttribute("page",page);
        model.addAttribute("teachers",teachers);
        return "teacherList";//查询成功，返回到一个页面
    }
}
