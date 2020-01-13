<%--
  Created by IntelliJ IDEA.
  User: leaveye
  Date: 2020/1/10
  Time: 16:34
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
            <strong>你现在所在的位置是:</strong>
            <span>公告管理页面 >> 公告修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="${basePath}/notice/noticeUpdate" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="">
                    <label for="providerId">公告编码：</label>
                    <input type="text" name="noticeId" value="${notice.id}" id="providerId" placeholder="请输入公告编码"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="providerName">栏目名称：</label>
                    <input type="text" name="title"value="${notice.title}" id="providerName" placeholder="请输入栏目名称"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="address">公告具体内容：</label>
                    <input type="text" name="content"value="${notice.content}" id="address" placeholder="请输入公告内容"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="sendTime">公告发送时间：</label>
                    <input type="text" name="sendTime" value="${notice.sendTime}"id="sendTime" placeholder="修改公告发送时间"/>
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
<script src="${basePath}/admin/js/time.js"></script>

</body>
</html>
