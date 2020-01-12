package com.jxau.dao;

import com.jxau.model.Reserve;
import com.jxau.model.Teacher;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ReserveDao {

    @Select("select * from reserve")
    List<Reserve> getAllReserve();

    @Select("select * from reserve where id=#{id}")
    Reserve getReserveById(int id);

    @Delete("delete from reserve where id=#{id}")
    int deleteReserve(int id);

    @Update("update reserve set reserveStatus=#{reserveStatus} where id=#{id}")
    int updateReserve(Reserve reserve);

    @Select("select * from reserve limit #{currentPage},#{pageNum}")
    List<Reserve> getReserveByPage(@Param("currentPage") int currentPage, @Param("pageNum") int pageNum);

    @Select("select count(*) from reserve")
    int getTotalReserve();

    @Select("select * from reserve where reserveStatus=#{reserveStatus}")
    List<Reserve> getReserveByStatus(String reserveStatus);



    //传入多个参数要用集合
    //把查询的内容分页显示到预约管理页面
    @Select("select * from reserve " +
            "where reserveStatus=#{reserveStatus} " +
            "limit #{currentPage},#{pageNum}")
    List<Reserve> getAllReserveByStatus(Map<String,Object> map);

    //查询--根据预约状态查询所得---总记录数
    @Select("select count(*) from reserve " +
            "where reserveStatus=#{reserveStatus} ")
    int getAllReserveByStatusTotal(Map<String,Object> map);




}
