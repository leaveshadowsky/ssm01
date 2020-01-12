<%--
  Created by IntelliJ IDEA.
  User: leaveye
  Date: 2020/1/10
  Time: 17:28
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
            <span>预约管理页面 >> 预约修改页面</span>
        </div>
        <%
            String id=request.getParameter("id");
            String teacherId=request.getParameter("teacherId");
            String studentId=request.getParameter("studentId");
            String studentName=request.getParameter("studentName");
            String teacherName=request.getParameter("teacherName");
            String reserveTime=request.getParameter("reserveTime");
        %>

        <div class="providerAdd">
            <form action="${basePath}/reserve/updateReserve">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="id">预约id：</label>
                    <input type="text" name="id" id="id" value="<%=id%>" placeholder="<%=id%>" readonly/>
                    <span>*</span>
                </div>
                <div>
                    <label for="teacherId">老师id：</label>
                    <input type="text" name="teacherId" id="teacherId" value="<%=teacherId%>" placeholder="<%=teacherId%>" readonly/>
                    <span >*</span>
                </div>
                <div>
                    <label for="teacherName">老师姓名：</label>
                    <input type="text" name="teacherName" id="teacherName" value="<%=teacherName%>" placeholder="<%=teacherName%>" readonly/>
                    <span >*</span>
                </div>
                <div>
                    <label for="studentId">学生id：</label>
                    <input type="text" name="studentId" id="studentId" value="<%=studentId%>" placeholder="<%=studentId%>"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="studentName">学生姓名：</label>
                    <input type="text" name="studentName" id="studentName" value="<%=studentName%>" placeholder="<%=studentName%>" readonly/>
                    <span >*</span>
                </div>
                <div>
                    <label for="reserveTime">预约时间：</label>
                    <input type="text" name="reserveTime" id="reserveTime" value="<%=reserveTime%>" placeholder="<%=reserveTime%>" readonly/>
                    <span >*</span>
                </div>

                <div>
                    <label for="reserveStatus">预约状态：</label>
                    <select name="reserveStatus" id="reserveStatus" style="margin-left: 0px;margin-top: 10px;">
                        <option value="等待确认">等待确认</option>
                        <option value="预约成功">预约成功</option>
                        <option value="预约失败">预约失败</option>
                    </select>
                </div>


                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="providerList.html">返回</a>-->
                    <input type="submit" value="保存"/>
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
