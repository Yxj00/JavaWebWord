<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/4/13
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%session.invalidate();
response.sendRedirect("index.jsp");%>
</body>
</html>
