package com.jxau.dao;

import com.jxau.model.Student;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface StudentDao {

    @Select("select * from student where parentId=#{parentId}")
    public List<Student> getStudentByParentId();

    @Select("select * from student where id =#{id}")
    Student selectStudentById(int id);

    @Update("update student set studentStatus=#{studentStatus} where id=#{id}")
    int updateStudentStatus(Student student);
}
