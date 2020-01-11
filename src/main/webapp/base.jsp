<%--
  Created by IntelliJ IDEA.
  User: leaveye
  Date: 2020/1/9
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--将虚拟目录存在bathPath中，使用绝对路径--%>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>

<%--<%--%>
    <%--Object userObj = session.getAttribute("user");--%>
    <%--if(userObj == null){--%>
        <%--response.sendRedirect("admin/login.jsp");--%>
    <%--}--%>
<%--%>--%>

<script>
    <c:if test="${not empty tips}">
    alert("${tips}");
    </c:if>
</script>

