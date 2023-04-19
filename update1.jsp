<%@ page import="com.icss.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/4/13
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
    <style>
        body {
            background: url('https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547_1280.jpg') no-repeat;
            background-size: 100% 130%;
        }

        #login_box {
            width: 20%;
            height: 300px;
            background-color: #00000060;
            margin: auto;
            margin-top: 7%;
            text-align: center;
            border-radius: 10px;
            padding: 50px 50px;
        }

        h2 {
            color: #ffffff90;
            margin-top: 5%;
        }

        #input-box {
            margin-top: 5%;
        }

        span {
            color: #fff;
        }

        input {
            border: 0;
            width: 60%;
            font-size: 15px;
            color: #fff;
            background: transparent;
            border-bottom: 2px solid #fff;
            padding: 5px 10px;
            outline: none;
            margin-top: 10px;
        }

        button {
            margin-top: 50px;
            width: 60%;
            height: 30px;
            border-radius: 10px;
            border: 0;
            color: #fff;
            text-align: center;
            line-height: 30px;
            font-size: 15px;
            background-image: linear-gradient(to right, #30cfd0, #330867);
        }

        #sign_up {
            margin-top: 45%;
            margin-left: 60%;
        }

        a {
            color: #b94648;
        }
    </style>
</head>
<body>
<% User user= (User) request.getAttribute("user"); %>
<form action="user?op=update1" method="post">
    <div id="login_box">
        <h2>修改信息</h2>
        <div id="input_box">
            <input type="text" name="id" id="id"  hidden placeholder="请输入id" value="<%=user.getId()%>">
        </div>
        <div class="input_box">
            <input type="text" name="username" id="username" placeholder="请输入用户名" value="${requestScope.username}">
        </div>
        <div class="input_box">
            <input type="password" name="password" placeholder="请输入密码" value="${requestScope.password}">
        </div>
        <div class="input_box">
            <input type="text" name="phone" placeholder="请输入手机号码" value="${requestScope.phone}">
        </div>
        <button type="submit" >保存修改</button><br>
    </div>
</form>
</body>
</html>