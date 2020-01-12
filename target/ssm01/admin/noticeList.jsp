<%--
  Created by IntelliJ IDEA.
  User: leaveye
  Date: 2020/1/10
  Time: 16:02
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
    <h1>朝腾科技家教管理系统</h1>
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
            <span>公告管理页面</span>
        </div>
        <form class="search" action="${basePath}/notice/getAllNoticeByContentTitle" method="post">
            <span>公告名称：</span>
            <input type="text" name="title" placeholder="请输入公告标题"/>
            <input type="text" name="content" placeholder="请输入公告内容"/>

            <input type="submit" value="查询"/>
            <a href="${basePath}/admin/noticeAdd.jsp">添加公告</a>
        </form>
        <!--账单表格 样式和供应商公用-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">编码</th>
                <th width="20%">栏目名称</th>
                <th width="10%">公告内容</th>
                <th width="10%">发布时间</th>
                <th width="20%">操作</th>
            </tr>
            <c:forEach items="${notices}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.title}</td>
                    <td>${item.content}</td>
                    <td>${item.sendTime}</td>
                    <td>
                        <a href="${basePath}/notice/lookCurrentNotice?id=${item.id}"><img src="${basePath}/admin/img/read.png" alt="查看" title="查看"/></a>
                        <a href="${basePath}/notice/lookCurrentNotice?id=${item.id}&update='true'"><img src="${basePath}/admin/img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="${basePath}/notice/deleteNotice?id=${item.id}" class="removeBill"><img src="${basePath}/admin/img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p align="center" style="font-family: cursive; font-size: large">
            当前页面${page.pageNo}
            <a href="${basePath}/notice/getAllNoticeByPage?currentPage=${page.firstPage}">首页</a>
            <a href="${basePath}/notice/getAllNoticeByPage?currentPage=${page.prePage}">上一页</a>
            <a href="${basePath}/notice/getAllNoticeByPage?currentPage=${page.nextPage}">下一页</a>
            <a href="${basePath}/notice/getAllNoticeByPage?currentPage=${page.lastPage}">尾页</a>
            共${page.pageCount}页
        </p>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该公告吗？</p>
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
