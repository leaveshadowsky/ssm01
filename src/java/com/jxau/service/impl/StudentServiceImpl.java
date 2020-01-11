package com.jxau.service.impl;

import com.jxau.dao.StudentDao;
import com.jxau.model.Student;
import com.jxau.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {


    @Autowired
    StudentDao studentDao;

    @Override
    public Student selectStudentById(int id) {
        return studentDao.selectStudentById(id);
    }

    @Override
    public int updateStudentStatus(Student student) {
        return studentDao.updateStudentStatus(student);
    }
}
