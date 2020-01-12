<%--
  Created by IntelliJ IDEA.
  User: leaveye
  Date: 2020/1/10
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../base.jsp"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>朝腾科技家教管理系统</title>
    <link rel="stylesheet" href="${basePath}/admin/css/public.css"/>
    <link rel="stylesheet" href="${basePath}/admin/css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>朝腾科技智慧社区平台项目管理系统</h1>

    <div class="publicHeaderR">
        <p><span>管理员: </span><span style="color: #fff21b"> ${sessionScope.admin1.userName}</span> , 欢迎你！</p>
        <a href="${basePath}/admin/login.jsp">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
</section>
<!--主体内容-->
<section class="publicMian">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="${basePath}/notice/getAllNoticeByPage">公告管理</a></li>
                <li><a href="${basePath}/teacher/getAllTeacher">教师管理</a></li>
                <li><a href="${basePath}/parent/getAllParent">家长管理</a></li>
                <li><a href="${basePath}/reserve/getReserveByPage">预约管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>家长管理页面 >> 家长信息查看</span>
        </div>
        <div class="providerView">
            <p><strong>家长姓名：</strong><span>${parent.realName}</span></p>
            <p><strong>家长用户名：</strong><span>${parent.name}</span></p>
            <p><strong>密码：</strong><span>${parent.password}</span></p>
            <p><strong>性别：</strong><span>${parent.sex}</span></p>
            <p><strong>孩子姓名：</strong><span>张小三</span></p>
            <p><strong>年龄：</strong><span>${parent.age}</span></p>
            <p><strong>联系方式：</strong><span>${parent.tel}</span></p>
            <p><strong>住址：</strong><span>${parent.address}</span></p>

            <a href="${basePath}/parent/getAllParent">返回</a>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="${basePath}/admin/js/time.js"></script>

</body>
</html>
