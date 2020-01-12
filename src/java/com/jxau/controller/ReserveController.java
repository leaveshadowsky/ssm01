package com.jxau.controller;


import com.jxau.model.Reserve;
import com.jxau.model.Student;
import com.jxau.model.Teacher;
import com.jxau.service.ReserveService;
import com.jxau.service.StudentService;
import com.jxau.service.TeacherService;
import com.jxau.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reserve")
@SessionAttributes(value={"reserves","students","teachers","page"})
public class ReserveController {

    @Autowired
    ReserveService reserveService;
    @Autowired
    StudentService studentService;
    @Autowired
    TeacherService teacherService;


    @RequestMapping("/getAllReserve")
    public String getAllReserve(Model model){
        List<Student> students=new ArrayList<Student>();
        List<Teacher> teachers=new ArrayList<Teacher>();
        List<Reserve> reserves=reserveService.getAllReserve();
        for(Reserve re:reserves){
            int teacherId=re.getTeacherId();
            Teacher teacher=teacherService.selectTeacherById(teacherId);
            teachers.add(teacher);
            int studentId=re.getStudentId();
            Student student=studentService.selectStudentById(studentId);
            students.add(student);
        }

        model.addAttribute("reserves",reserves);
        model.addAttribute("students",students);
        model.addAttribute("teachers",teachers);
        return "/admin/reserveList.jsp";
    }


    @RequestMapping("/getReserveByPage")
    public String getReserveByPage(HttpServletRequest request, Model model){

        List<Student> students=new ArrayList<Student>();
        List<Teacher> teachers=new ArrayList<Teacher>();
        String currentPage=request.getParameter("currentPage");
        if(currentPage==null){
            currentPage="1";
        }
        int current=Integer.parseInt(currentPage);
        int pageNum = 5;
        List<Reserve> reserves = reserveService.getReserveByPage((current-1)*pageNum,pageNum);
        for (Reserve re:reserves){
            int teacherId=re.getTeacherId();
            Teacher teacher=teacherService.selectTeacherById(teacherId);
            teachers.add(teacher);
            int studentId=re.getStudentId();
            Student student=studentService.selectStudentById(studentId);
            students.add(student);
        }
        int totals = reserveService.getTotalReserve();
        Page page = new Page(current,pageNum);
        page.setResult(reserves,totals);
        model.addAttribute("page",page);
        model.addAttribute("reserves",reserves);
        model.addAttribute("students",students);
        model.addAttribute("teachers",teachers);
        return "reserveList";

    }


    @RequestMapping("/deleteReserve")
    public String deleteReserve(HttpServletRequest request,int id,Model model){
        Reserve res=reserveService.getReserveById(id);
        if(res.getReserveStatus().equals("预约成功")){
            int teacherId=res.getTeacherId();
            Teacher teacher=teacherService.selectTeacherById(teacherId);
            teacher.setTeacherStatus("预约中");
            teacherService.updateTeacherStatus(teacher);
            int studentId=res.getStudentId();
            Student student=studentService.selectStudentById(studentId);
            student.setStudentStatus("预约中");
            studentService.updateStudentStatus(student);
        }
        reserveService.deleteReserve(id);
        return "redirect:/reserve/getReserveByPage";
    }


    @RequestMapping("/updateReserve")
    public String updateReserve(HttpServletRequest request,Model model){

        Reserve res=reserveService.getReserveById(Integer.parseInt(request.getParameter("id")));
        //res.setReserveStatus(request.getParameter("reserveStatus"));

        if(res.getReserveStatus().equals("预约成功")){
            if(!(request.getParameter("reserveStatus").equals("预约成功"))){
                int teacherId=res.getTeacherId();
                Teacher teacher=teacherService.selectTeacherById(teacherId);
                teacher.setTeacherStatus("预约中");
                teacherService.updateTeacherStatus(teacher);
                int studentId=res.getStudentId();
                Student student=studentService.selectStudentById(studentId);
                student.setStudentStatus("预约中");
                studentService.updateStudentStatus(student);
            }
        }

        if(!(res.getReserveStatus().equals("预约成功"))){
            if((request.getParameter("reserveStatus").equals("预约成功"))){
                int teacherId=res.getTeacherId();
                Teacher teacher=teacherService.selectTeacherById(teacherId);
                teacher.setTeacherStatus("已有学生");
                teacherService.updateTeacherStatus(teacher);
                int studentId=res.getStudentId();
                Student student=studentService.selectStudentById(studentId);
                student.setStudentStatus("已有家教");
                studentService.updateStudentStatus(student);

            }
        }

        res.setReserveStatus(request.getParameter("reserveStatus"));
        reserveService.updateReserve(res);
        return "redirect:/reserve/getReserveByPage";
    }


    @RequestMapping("/getReserveById")
    public String getReserveById(int id,Model model){
        Reserve reserves =reserveService.getReserveById(id);
        model.addAttribute("reserves",reserves);
        return "reserveView";

    }

    @RequestMapping("/getReserveByStatus")
    public String getReserveByStatus(String reserveStatus,Model model){
        List<Student> students=new ArrayList<Student>();
        List<Teacher> teachers=new ArrayList<Teacher>();
        List<Reserve> reserves =reserveService.getReserveByStatus(reserveStatus);
        for(Reserve re:reserves){
            int teacherId=re.getTeacherId();
            Teacher teacher=teacherService.selectTeacherById(teacherId);
            teachers.add(teacher);
            int studentId=re.getStudentId();
            Student student=studentService.selectStudentById(studentId);
            students.add(student);
        }
        model.addAttribute("reserves",reserves);
        model.addAttribute("students",students);
        model.addAttribute("teachers",teachers);
        return "reserveList";

    }



    //根据预约状态查询提交之后，提交到该方法
    //将该预约信息放到model设置得属性reserves中，并分页显示
    //查询成功，返回到一个页面
    @RequestMapping(path = "/getAllReserveByStatus")
    public String getAllReserveByStatus(String reserveStatus,Model model, HttpServletRequest request, HttpSession session){
        List<Student> students=new ArrayList<Student>();
        List<Teacher> teachers=new ArrayList<Teacher>();
        //每提交一次就存到session里面
        session.setAttribute("reserveStatus",reserveStatus);
        int current;
        String currentPage=request.getParameter("currentPage");
        if(currentPage==null){
            currentPage="1";
        }
        current=Integer.parseInt(currentPage);
        int pageNum = 5;
        Map<String ,Object> map = new HashMap<String ,Object>();
        //map的名字要和sql里面的名字一致
        map.put("reserveStatus",session.getAttribute("reserveStatus"));
        int c = (current-1)*pageNum;
        map.put("currentPage",c);
        map.put("pageNum",pageNum);
        List<Reserve> reserves = reserveService.getAllReserveByStatus(map);
        for (Reserve re:reserves){
            int teacherId=re.getTeacherId();
            Teacher teacher=teacherService.selectTeacherById(teacherId);
            teachers.add(teacher);
            int studentId=re.getStudentId();
            Student student=studentService.selectStudentById(studentId);
            students.add(student);
        }
        //根据预约状态查询所得的长度
        int totals = reserveService.getAllReserveByStatusTotal(map);
        Page page = new Page(current,pageNum);
        page.setResult(reserves,totals);
        model.addAttribute("page",page);
        model.addAttribute("reserves",reserves);
        model.addAttribute("students",students);
        model.addAttribute("teachers",teachers);

        return "reserveList2";
    }



    //该方法用于解决查询所提交的参数被不断刷新覆盖的问题
    //currentPage参数提交到这个方法中
    @RequestMapping("/getCurrentPage")
    public String getCurrentPage(String currentPage,HttpSession session,Model model){
        List<Student> students=new ArrayList<Student>();
        List<Teacher> teachers=new ArrayList<Teacher>();
        int current = Integer.parseInt(currentPage);
        int pageNum = 5;
        int c = (current-1)*pageNum;
        Map<String ,Object> map = new HashMap<String ,Object>();
        //从session里面取值
        map.put("reserveStatus",session.getAttribute("reserveStatus"));
        map.put("currentPage",c);
        map.put("pageNum",pageNum);
        List<Reserve> reserves = reserveService.getAllReserveByStatus(map);
        for (Reserve re:reserves){
            int teacherId=re.getTeacherId();
            Teacher teacher=teacherService.selectTeacherById(teacherId);
            teachers.add(teacher);
            int studentId=re.getStudentId();
            Student student=studentService.selectStudentById(studentId);
            students.add(student);
        }
        //根据预约状态查询所得的长度
        int totals = reserveService.getAllReserveByStatusTotal(map);
        Page page = new Page(current,pageNum);
        page.setResult(reserves,totals);
        model.addAttribute("page",page);
        model.addAttribute("reserves",reserves);
        model.addAttribute("students",students);
        model.addAttribute("teachers",teachers);

        return "reserveList2";
    }


}
