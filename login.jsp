<%@ page import="com.icss.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/4/13
  Time: 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/modernizr.custom.js"></script>
    <link rel="stylesheet" type="text/css" href="css/component.css" />
</head>
<body>
<%
    String username = request.getParameter("username");
    session.setAttribute("username",username);
    // 获取session中的数据
    String name = (String) session.getAttribute("username");
    // 判断是否为空
    if (name==null){
        // 设置错误信息
        request.setAttribute("message","你小子不登录是吧！不登录别进！！！");
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
%>
${requestScope.message}
<form action="user?op=login">
<!--header-->
<div class="header" >
    <div class="top-header">
<%--        <div class="container">--%>
            <h1 style="text-align: center">欢迎【<%=name%>】</h1>
<%--        </div>--%>
    </div>
    <!---->
    <div class="header-top">
        <div class="container">
            <div class="head-top">
                <div class="logo">

                    <h1><a href="testLogin.jsp"><span> G</span>ames <span>C</span>enter</a></h1>

                </div>
                <div class="top-nav">
                    <span class="menu"><img src="images/menu.png" alt=""> </span>

                    <ul>
                        <li><a class="color2"  href="user?op=findById1&id=${user.id}">修改账户信息</a></li>
                        <li><a class="color3"  href="upload.jsp">上传游戏</a></li>
                        <li><a class="color3"  href="exit.jsp">退出登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--banner-->


    <div class="banner">
        <div class="container">
            <div class="wmuSlider example1">
                <div class="wmuSliderWrapper">
                    <article style="position: absolute; width: 100%; opacity: 0;">
                        <div class="banner-wrap">
                            <div class="banner-top">
                                <img src="images/12.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="banner-top banner-bottom">
                                <img src="images/11.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="clearfix"> </div>
                        </div>

                    </article>
                    <article style="position: absolute; width: 100%; opacity: 0;">
                        <div class="banner-wrap">

                            <div class="banner-top">
                                <img src="images/14.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="banner-top banner-bottom">
                                <img src="images/13.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="clearfix"> </div>

                        </div>
                    </article>
                    <article style="position: absolute; width: 100%; opacity: 0;">
                        <div class="banner-wrap">
                            <div class="banner-top">
                                <img src="images/16.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="banner-top banner-bottom">
                                <img src="images/15.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </article>
                </div>
                <ul class="wmuSliderPagination">
                    <li><a href="#" class="">0</a></li>
                    <li><a href="#" class="">1</a></li>
                    <li><a href="#" class="wmuActive">2</a></li>
                </ul>
            </div>
            <!---->
            <script src="js/jquery.wmuSlider.js"></script>
            <script>
                $('.example1').wmuSlider({
                    pagination : true,
                    nav : false,
                });
            </script>

        </div>
    </div>

    <!--content-->
    <div class="content">
        <div class="container">
            <div class="content-top">
                <h2 class="new">NEW GAMES</h2>

                <div class="wrap">
                    <div class="main">
                        <ul id="og-grid" class="og-grid">
                            <li>
                                <a href="#" data-largesrc="images/1.jpg" data-title="地铁跑酷" >
                                    <img class="img-responsive" src="images/thumbs/1.jpg" alt="img01"/>
                                </a>
                            </li>
                            <li>
                                <a href="#" data-largesrc="images/2.jpg" data-title="愤怒的小鸟">
                                    <img class="img-responsive" src="images/thumbs/2.jpg" alt="img02"/>
                                </a>
                            </li>
                            <li>  <a href="#" data-largesrc="images/3.jpg" data-title="Bike Games">
                                <img class="img-responsive" src="images/thumbs/3.jpg" alt="img03"/>
                            </a>
                            </li>
                            <li>  <a href="#" data-largesrc="images/4.jpg" data-title="Temple Run">
                                <img class="img-responsive" src="images/thumbs/4.jpg" alt="img01"/>
                                </a>
                            </li>
                            <li>  <a href="#" data-largesrc="images/5.jpg" data-title="地平线4">
                                <img class="img-responsive" src="images/thumbs/5.jpg" alt="img01"/>
                                </a>
                            </li>
                            <li>   <a href="#" data-largesrc="images/6.jpg" data-title="Fite Games">
                                <img class="img-responsive" src="images/thumbs/6.jpg" alt="img02"/>
                                </a>
                            </li>
                            <li> <a href="#" data-largesrc="images/7.jpg" data-title="Fite Games">
                                <img class="img-responsive" src="images/thumbs/7.jpg" alt="img03"/>
                                </a>
                            </li>
                            <li>
                                <a href="#" data-largesrc="images/8.jpg" data-title="功夫熊猫">
                                    <img class="img-responsive" src="images/thumbs/8.jpg" alt="img01"/></a>
                            </li>
                            <div class="clearfix"> </div>
                        </ul>
                    </div>
                </div>
            </div>
            <script src="js/grid.js"></script>
            <script>
                $(function() {
                    Grid.init();
                });
            </script>
        </div>
        <!----->
        <div class="col-mn">
            <div class="container">
                <div class="col-mn2">
                    <h3>The Best Features</h3>
                    <p>Contrary to popular belief
                        , Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.</p>
                    <a class=" more-in" href="#">Read More</a>
                </div>
            </div>
        </div>
    </div>

</form>
</body>
</html>