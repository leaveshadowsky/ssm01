package com.jxau.test;

import com.jxau.model.Parent;
import com.jxau.service.ParentService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestService {
    public static void main(String[] args) {
        // 读取配置文件
        ApplicationContext context = new ClassPathXmlApplicationContext("bean.xml");
        // 获取对象
        ParentService parentService = (ParentService)context.getBean("parentServiceImpl");

        Parent parent = new Parent();
        parent.setTel("13");
//        parent.setAddress("北京%");
        // 调用方法
//        System.out.println(parentService.getParent());


//        Map<String,Object> map = new HashMap<String,Object>();
//        map.put("currentPage",2);
//        map.put("pageNum",2);
//        System.out.println(parentService.getAllParent(map));


        System.out.println(parentService.getParentDetail(1));
    }
}
