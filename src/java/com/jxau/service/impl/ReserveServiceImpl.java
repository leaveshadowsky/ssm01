package com.jxau.service.impl;


import com.jxau.dao.ReserveDao;
import com.jxau.model.Reserve;
import com.jxau.service.ReserveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ReserveServiceImpl implements ReserveService {

    @Autowired
    ReserveDao reserveDao;

    @Override
    public List<Reserve> getAllReserve() {
        return reserveDao.getAllReserve();
    }

    @Override
    public int deleteReserve(int id) {
        return reserveDao.deleteReserve(id);
    }

    @Override
    public int updateReserve(Reserve reserve) {
        return reserveDao.updateReserve(reserve);
    }

    @Override
    public List<Reserve> getReserveByPage(int currentPage, int pageNum) {
        return reserveDao.getReserveByPage(currentPage,pageNum);
    }

    @Override
    public int getTotalReserve() {
        return reserveDao.getTotalReserve();
    }

    @Override
    public Reserve getReserveById(int id) {
        return reserveDao.getReserveById(id);
    }

    @Override
    public List<Reserve> getReserveByStatus(String reserveStatus) {
        return reserveDao.getReserveByStatus(reserveStatus);
    }

    @Override
    public List<Reserve> getAllReserveByStatus(Map<String, Object> map) {
        return reserveDao.getAllReserveByStatus(map);
    }

    @Override
    public int getAllReserveByStatusTotal(Map<String, Object> map) {
        return reserveDao.getAllReserveByStatusTotal(map);
    }

}
