<%--
  Created by IntelliJ IDEA.
  User: leaveye
  Date: 2020/1/10
  Time: 17:33
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
<section class="publicMian ">
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
            <span>教师管理页面 >> 新增教师页面</span>
        </div>
        <div class="providerAdd">
            <form action="${basePath}/teacher/teacherAdd" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="name">
                    <label for="providerId">老师用户名：</label>
                    <input type="text" name="name" id="name" placeholder="请输入用户名"/>
                    <span>*</span>
                </div>
                <div class="pwd">
                    <label for="providerId">密码：</label>
                    <input type="text" name="password" id="pwd" placeholder="请输入密码"/>
                    <span>*</span>
                </div>
                <div class="providerId">
                    <label for="providerId">老师姓名：</label>
                    <input type="text" name="realName" id="providerId" placeholder="请输入公告编码"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="providerName">性别：</label>
                    <input type="text" name="sex" id="providerName" placeholder="请输入性别"/>
                    <span >*</span>
                </div>
                <%--<div>--%>
                    <%--<label for="address">年龄：</label>--%>
                    <%--<input type="text" name="age" id="address" placeholder="请输入年龄"/>--%>
                    <%--<span>*</span>--%>
                <%--</div>--%>
                <div>
                    <label for="sendTime">住址：</label>
                    <input type="text" name="address" id="sendTime" placeholder="请输入住址"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="tel">电话：</label>
                    <input type="text" name="tel" id="tel" placeholder="请输入住址"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="subject">执教科目：</label>
                    <input type="text" name="subject" id="subject" placeholder="请输入执教科目"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="grade">执教年级：</label>
                    <input type="text" name="grade" id="grade" placeholder="请输入执教年级"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="education">学历：</label>
                    <input type="text" name="education" id="education" placeholder="请输入学历"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="introduce">自我介绍：</label>
                    <input type="text" name="introduce" id="introduce" placeholder="请输入自我介绍"/>
                    <span>*</span>
                </div>

                <div class="providerAddBtn">
                    <input type="submit" value="新增"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="${basePath}/admin/js/time.js"></script>

</body>
</html>
