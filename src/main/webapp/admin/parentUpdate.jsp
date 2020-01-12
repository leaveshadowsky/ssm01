<%--
  Created by IntelliJ IDEA.
  User: leaveye
  Date: 2020/1/10
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../base.jsp" %>
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
            <span>家长管理页面 >> 家长信息修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="${basePath}/parent/parentUpdate" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="providerId">家长编码：</label>
                    <input type="text" name="id" value="${parent.id}" id="providerId" placeholder="请输入编码"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="providerName">家长姓名：</label>
                    <input type="text" name="realName"value="${parent.realName}" id="providerName" placeholder="请输入家长姓名"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="address">家长用户名：</label>
                    <input type="text" name="name" value="${parent.name}"id="address" placeholder="请输入用户名"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="password">密码：</label>
                    <input type="text" name="password"value="${parent.password}" id="password" placeholder="修改密码"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="sex">性别：</label>
                    <input type="text" name="sex" value="${parent.sex}"id="sex" placeholder="修改性别"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="age">年龄：</label>
                    <input type="text" name="age"value="${parent.age}" id="age" placeholder="请输入年龄"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="sendTime">住址：</label>
                    <input type="text" name="address"value="${parent.address}" id="sendTime" placeholder="请输入住址"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="tel">电话：</label>
                    <input type="text" name="tel" value="${parent.tel}" id="tel" placeholder="请输入电话"/>
                    <span>*</span>
                </div>

                <div class="providerAddBtn">
                    <input type="submit" value="修改"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="js/time.js"></script>

</body>
</html>
