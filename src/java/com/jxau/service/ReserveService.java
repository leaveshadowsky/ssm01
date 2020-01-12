package com.jxau.service;

import com.jxau.model.Reserve;
import com.jxau.model.Teacher;

import java.util.List;
import java.util.Map;

public interface ReserveService {

    //获取所有的预约信息
    List<Reserve> getAllReserve();

    //删除预约信息
    int deleteReserve(int id);

    //修改预约状态
    int updateReserve(Reserve reserve);

    //通过分页获取预约信息
    List<Reserve> getReserveByPage(int currentPage, int pageNum);

    //获取预约信息的总数
    int getTotalReserve();

    //通过id获取预约信息
    Reserve getReserveById(int id);

    //通过状态获取预约信息
    List<Reserve> getReserveByStatus(String reserveStatus);



    //根据预约状态查询预约信息
    List<Reserve> getAllReserveByStatus(Map<String,Object> map);

    //求根据预约状态查询的总记录数
    int getAllReserveByStatusTotal(Map<String,Object> map);



}
