<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/4/12
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>Login Page | Amaze UI Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    * {
      margin: 0;
      padding: 0;
    }
    body {
      background: url('img1/4.jpg') no-repeat;
      background-size: 100% 130%;
    }

    .container {
      width: 20%;
      height: 300px;
      /*background-color: #00000060;*/
      margin: auto;
      margin-top: 10%;
      text-align: center;
      border-radius: 10px;
      padding: 50px 50px;
    }
    .login-wrapper {
      background-color: bisque;
      width: 358px;
      height: 588px;
      border-radius: 15px;
      padding: 0 50px;
      position: relative;
      left: 50%;
      top: 50%;
      transform: translate(-50%,-50%);

    }
    .header {
      font-size: 38px;
      font-weight: bold;
      text-align: center;
      line-height: 200px;
    }
    .input-item {
      display: block;
      width: 100%;
      margin-bottom: 20px;
      border: 0;
      padding: 10px;
      border-bottom: 1px solid rgb(128,125,125);
      font-size: 15px;
      outline: none;
    }
    .input-item::placeholder {
      text-transform: uppercase;
    }

    button {
      margin-top: 30px;
      width: 30%;
      height: 30px;
      border-radius: 10px;
      border: 0;
      color: #fff;
      text-align: center;
      line-height: 30px;
      font-size: 15px;
      background-image: linear-gradient(to right, #30cfd0, #330867);
    }
    .msg {
      text-align: center;
      line-height: 88px;
    }
    a {
      text-decoration-line: none;
      color: #abc1ee;
    }
    h3{
    color: red;
    }
  </style>
</head>
<body>
<%
  // 获取浏览器在cookie中存储的数据
  Cookie[] cookies = request.getCookies();
  String[] loginInfo=null;
  if (cookies!=null){
    for (Cookie cookie : cookies) {
      if ("loginInfo".equals(cookie.getName())){
        String value = cookie.getValue();
        loginInfo=value.split(":");
      }
    }
  }
%>

    <form method="post" class="am-form" action="user?op=admin">
      <div class="container">
        <div class="login-wrapper">
          <div class="header">登录注册
          </div>

          <div class="form-wrapper">
            <h3>${message}</h3>
            <input type="text" name="username" class="input-item" placeholder="请输入你的账号" value="<%if (loginInfo!=null){out.print(loginInfo[0]);}%>">
            <input type="password" name="password" id="password" class="input-item" placeholder="请输入密码" value="<%if (loginInfo!=null){out.print(loginInfo[1]);}%>">
            <input id="remember-me" type="checkbox" name="autoLogin" value="auto">记住密码
            <div class="btn">
              <button type="submit">管理员登录</button>
               <button type="submit">用户登录</button>
            </div>
          </div>
          <div class="msg">
            莫有账号？<a href="reg.jsp" target="_blank">注册一个吧</a>
          </div>
          <p>© 2023 中软国际JAVA1班</p>
        </div>
      </div>
    </form>
</body>
</html>
