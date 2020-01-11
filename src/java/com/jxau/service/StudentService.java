package com.jxau.service;

import com.jxau.model.Student;

public interface StudentService {

    //通过id查询学生
    Student selectStudentById(int id);

    //修改学生预约状态
    int updateStudentStatus(Student student);
}
