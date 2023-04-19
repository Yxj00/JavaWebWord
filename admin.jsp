<%@ page import="java.util.List" %>
<%@ page import="com.icss.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/4/13
  Time: 8:27
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员页面</title>
    <link rel="stylesheet" href="css/personal_info.css" type="text/css" media="all">
</head>
<body>
<h1>欢迎管理员回来</h1>
<div class="element">
    <div class="element-right">
        <div class="teddy-bear">
            <div class="teddy-text">
                <img src="img1/a1.jpg" class="img-responsive">
                <h4>苦逼程序员</h4>
            </div>
            <div class="teddy-follow">
                <ul>
                    <li class="folw-h">
                        <h3>${count}</h3>
                        <p>用户在线数量</p>
                    </li>
                    <li class="folw-r">
                        <h3>${countAll}</h3>
                        <p>已注册</p>
                    </li>
                    <div class="clear"></div>
                </ul>
            </div>
        </div>
    </div>
    <div class="element-last">
        <ul class="content">
            <li class="menu button">
                <a href="user?op=findAll">查询所有用户<span class="icon"></span></a>
            </li>
<%--            <li class="menu button">--%>
<%--                <a href="">退出登录<span class="icon stat"></span><i>13</i></a>--%>
<%--            </li>--%>
            <li class="menu button">
                <a href="#">设置<span class="icon msg"></span></a>
            </li>
            <li class="menu info button">
                <a href="exit.jsp">退出登录<span class="icon signout"></span></a>
            </li>
        </ul>
    </div>
    <div class="clear"></div>
</div>
</body>
</html>