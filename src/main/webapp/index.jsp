<%@ page import="com.ybq.pojo.DevUser" %><%--
  Created by IntelliJ IDEA.
  User: ybq
  Date: 2019/2/23
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    DevUser devUser = (DevUser)session.getAttribute("devUser");
    if (devUser != null && devUser.getId() != null){
        response.sendRedirect("/jsp/dev/index.jsp");
    }
%>
<a href="">管理员入口</a>
<a href="${ctx}/app/toLogin">开发者入口</a>

</body>
</html>
