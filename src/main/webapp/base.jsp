<%--
  Created by IntelliJ IDEA.
  User: leaveye
  Date: 2020/1/9
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--将虚拟目录存在bathPath中，使用绝对路径--%>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>

<script>
    <c:if test="${not empty tips}">
    alert("${tips}")
    </c:if>
</script>

