<%--
  Created by IntelliJ IDEA.
  User: 22673
  Date: 2020/1/12
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <h1>朝腾科技家教管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎您！</p>
        <a href="login.jsp">退出</a>
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
                <li><a href="${basePath}/admin/password.jsp">密码修改</a></li>
                <li><a href="${basePath}/admin/login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>您现在所在的位置是:</strong>
            <span>预约管理页面</span>
        </div>
        <form class="search" action="${basePath}/reserve/getAllReserveByStatus" method="post">
            <span></span>
            <%--<input type="text" name="reserveStatus" placeholder="请输入预约状态"/>--%>

            <select name="reserveStatus" id="reserveStatus">
                <option value="等待确认">等待确认</option>
                <option value="预约成功">预约成功</option>
                <option value="预约失败">预约失败</option>
            </select>


            <input type="submit" value="查询"/>
        </form>
        <!--用户-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="5%">预约ID</th>
                <th width="5%">教师ID</th>
                <th width="10%">教师姓名</th>
                <th width="10%">教师电话</th>
                <th width="5%">学员ID</th>
                <th width="10%">学员姓名</th>
                <th width="10%">学员电话</th>
                <th width="10%">预约时间</th>
                <th width="15%>">预约状态</th>
                <th width="20%">操作</th>
            </tr>
            <c:forEach items="${reserves}" var="item" varStatus="loop">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.teacherId}</td>
                    <td>${teachers[loop.index].name}</td>
                    <td>${teachers[loop.index].tel}</td>
                    <td>${item.studentId}</td>
                    <td>${students[loop.index].name}</td>
                    <td>${students[loop.index].tel}</td>
                    <td>${item.reserveTime}</td>
                    <td>${item.reserveStatus}</td>
                    <td>
                        <a href="${basePath}/reserve/getReserveById?id=${item.id}"><img src="${basePath}/admin/img/read.png" alt="查看" title="查看"/></a>
                        <a href="${basePath}/admin/reserveUpdate.jsp?id=${item.id}&teacherId=${item.teacherId}&studentId=${item.studentId}
                    &reserveTime=${item.reserveTime}"><img src="${basePath}/admin/img/xiugai.png" alt="修改" title="修改"/></a>
                            <%--<a href="#" class="removeUser"><img src="${basePath}/admin/img/schu.png" alt="删除" title="删除"/></a>--%>
                        <a href="${basePath}/reserve/deleteReserve?id=${item.id}" ><img src="${basePath}/admin/img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p style="font-family: cursive; font-size: large" align="center">
            当前页面${page.pageNo}
            <a href="${basePath}/reserve/getCurrentPage?currentPage=${page.firstPage}">首页</a>
            <a href="${basePath}/reserve/getCurrentPage?currentPage=${page.prePage}">上一页</a>
            <a href="${basePath}/reserve/getCurrentPage?currentPage=${page.nextPage}">下一页</a>
            <a href="${basePath}/reserve/getCurrentPage?currentPage=${page.lastPage}">尾页</a>
            共${page.pageCount}页
        </p>

    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该记录吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<footer class="footer">
</footer>

<script src="${basePath}/admin/js/jquery.js"></script>
<script src="${basePath}/admin/js/js.js"></script>
<script src="${basePath}/admin/js/time.js"></script>

</body>
</html>
