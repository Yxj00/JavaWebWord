<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/4/16
  Time: 13:38
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
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Games Center Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <link href='http://fonts.useso.com/css?family=Montserrat+Alternates:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
    <!--//fonts-->
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

<!--header-->
<div class="header" >
    <div class="top-header" >
        <div class="container">
            <h1>欢迎【<%=name%>】</h1>
<%--            <div class="top-head" >--%>
<%--                <ul class="header-in">--%>
<%--                    <li ><a href="#" >  Help</a></li>--%>
<%--                    <li><a href="contact.html">   Contact Us</a></li>--%>
<%--                    <li ><a href="#" >   How To Use</a></li>--%>
<%--                </ul>--%>
<%--                <div class="search">--%>
<%--                    <form>--%>
<%--                        <input type="text" value="search about something ?" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'search about something ?';}" >--%>
<%--                        <input type="submit" value="" >--%>
<%--                    </form>--%>
<%--                </div>--%>

<%--                <div class="clearfix"> </div>--%>
<%--            </div>--%>
        </div>
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
                        <li class="active"><a class="color1" href="testLogin.jsp"  >主页</a></li>
                        <li><a class="color2"  href="user?op=findById1&id=${user.id}">修改账户信息</a></li>
                        <li><a class="color3"  href="upload.jsp">上传</a></li>
                        <li><a class="color3"  href="exit.jsp">退出登录</a></li>
                        <!-- <li><a class="color3" href="reviews.html"  >Reviews</a></li>
                        <li><a class="color4" href="404.html" >News</a></li>
                        <li><a class="color5" href="blog.html"  >Blog</a></li>
                        <li><a class="color6" href="contact.html" >Contact</a></li> -->
                        <div class="clearfix"> </div>
                    </ul>

                    <!--script-->
                    <script>
                        $("span.menu").click(function(){
                            $(".top-nav ul").slideToggle(500, function(){
                            });
                        });
                    </script>

                </div>

                <div class="clearfix"> </div>
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
                            <a href="#" data-largesrc="images/1.jpg" data-title="Subway Surfers" data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada purus a convallis dictum. Phasellus sodales varius diam, non sagittis lectus. Morbi id magna ultricies ipsum condimentum scelerisque vel quis felis.. Donec et purus nec leo interdum sodales nec sit amet magna. Ut nec suscipit purus, quis viverra urna.">
                                <img class="img-responsive" src="images/thumbs/1.jpg" alt="img01"/>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-largesrc="images/2.jpg" data-title="Angry Birds" data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada purus a convallis dictum. Phasellus sodales varius diam, non sagittis lectus. Morbi id magna ultricies ipsum condimentum scelerisque vel quis felis.. Donec et purus nec leo interdum sodales nec sit amet magna. Ut nec suscipit purus, quis viverra urna.">
                                <img class="img-responsive" src="images/thumbs/2.jpg" alt="img02"/>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-largesrc="images/3.jpg" data-title="Bike Games"  data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada purus a convallis dictum. Phasellus sodales varius diam, non sagittis lectus. Morbi id magna ultricies ipsum condimentum scelerisque vel quis felis.. Donec et purus nec leo interdum sodales nec sit amet magna. Ut nec suscipit purus, quis viverra urna.">
                                <img class="img-responsive" src="images/thumbs/3.jpg" alt="img03"/>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-largesrc="images/4.jpg" data-title="Temple Run"  data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada purus a convallis dictum. Phasellus sodales varius diam, non sagittis lectus. Morbi id magna ultricies ipsum condimentum scelerisque vel quis felis.. Donec et purus nec leo interdum sodales nec sit amet magna. Ut nec suscipit purus, quis viverra urna.">
                                <img class="img-responsive" src="images/thumbs/4.jpg" alt="img01"/>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-largesrc="images/5.jpg" data-title="Car Games"  data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada purus a convallis dictum. Phasellus sodales varius diam, non sagittis lectus. Morbi id magna ultricies ipsum condimentum scelerisque vel quis felis.. Donec et purus nec leo interdum sodales nec sit amet magna. Ut nec suscipit purus, quis viverra urna.">
                                <img class="img-responsive" src="images/thumbs/5.jpg" alt="img01"/>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-largesrc="images/6.jpg" data-title="Fite Games"  data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada purus a convallis dictum. Phasellus sodales varius diam, non sagittis lectus. Morbi id magna ultricies ipsum condimentum scelerisque vel quis felis.. Donec et purus nec leo interdum sodales nec sit amet magna. Ut nec suscipit purus, quis viverra urna.">
                                <img class="img-responsive" src="images/thumbs/6.jpg" alt="img02"/>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-largesrc="images/7.jpg" data-title="Fite Games"  data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada purus a convallis dictum. Phasellus sodales varius diam, non sagittis lectus. Morbi id magna ultricies ipsum condimentum scelerisque vel quis felis.. Donec et purus nec leo interdum sodales nec sit amet magna. Ut nec suscipit purus, quis viverra urna.">
                                <img class="img-responsive" src="images/thumbs/7.jpg" alt="img03"/>
                            </a>
                        </li>
                        <li>
                            <a href="#" data-largesrc="images/8.jpg" data-title="Panda Game" data-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada purus a convallis dictum. Phasellus sodales varius diam, non sagittis lectus. Morbi id magna ultricies ipsum condimentum scelerisque vel quis felis.. Donec et purus nec leo interdum sodales nec sit amet magna. Ut nec suscipit purus, quis viverra urna.">
                                <img class="img-responsive" src="images/thumbs/8.jpg" alt="img01"/>
                            </a>
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
                <a class=" more-in" href="single.html">Read More</a>
            </div>
        </div>
    </div>
    <!---->
    <div class="featured">
        <div class="container">
            <div class="col-md-4 latest">
                <h4>Latest</h4>
                <div class="late">
                    <a href="single.html" class="fashion"><img class="img-responsive " src="images/la.jpg" alt=""></a>
                    <div class="grid-product">
                        <span>6 Apr, 2015</span>
                        <p><a href="single.html"> Ipsum dolor sit amet, consectetuer adipiscing elit,it has roots </a></p>
                        <a class="comment" href="single.html"><i> </i> 0 Comments</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="late">
                    <a href="single.html" class="fashion"><img class="img-responsive " src="images/la1.jpg" alt=""></a>
                    <div class="grid-product">
                        <span>6 Apr, 2015</span>
                        <p><a href="single.html"> Ipsum dolor sit amet, consectetuer adipiscing elit,it has roots </a></p>
                        <a class="comment" href="single.html"><i> </i> 0 Comments</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="late">
                    <a href="single.html" class="fashion"><img class="img-responsive " src="images/la2.jpg" alt=""></a>
                    <div class="grid-product">
                        <span>6 Apr, 2015</span>
                        <p><a href="single.html"> Ipsum dolor sit amet, consectetuer adipiscing elit,it has roots </a></p>
                        <a class="comment" href="single.html"><i> </i> 0 Comments</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="col-md-4 latest">
                <h4>Featured</h4>
                <div class="late">
                    <a href="single.html" class="fashion"><img class="img-responsive " src="images/la3.jpg" alt=""></a>
                    <div class="grid-product">
                        <span>6 Apr, 2015</span>
                        <p><a href="single.html"> Ipsum dolor sit amet, consectetuer adipiscing elit,it has roots </a></p>
                        <a class="comment" href="single.html"><i> </i> 0 Comments</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="late">
                    <a href="single.html" class="fashion"><img class="img-responsive " src="images/la2.jpg" alt=""></a>
                    <div class="grid-product">
                        <span>6 Apr, 2015</span>
                        <p><a href="single.html"> Ipsum dolor sit amet, consectetuer adipiscing elit,it has roots </a></p>
                        <a class="comment" href="single.html"><i> </i> 0 Comments</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="late">
                    <a href="single.html" class="fashion"><img class="img-responsive " src="images/la1.jpg" alt=""></a>
                    <div class="grid-product">
                        <span>6 Apr, 2015</span>
                        <p><a href="single.html"> Ipsum dolor sit amet, consectetuer adipiscing elit,it has roots </a></p>
                        <a class="comment" href="single.html"><i> </i> 0 Comments</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="col-md-4 latest">
                <h4>Popular</h4>
                <div class="late">
                    <a href="single.html" class="fashion"><img class="img-responsive " src="images/la1.jpg" alt=""></a>
                    <div class="grid-product">
                        <span>6 Apr, 2015</span>
                        <p><a href="single.html"> Ipsum dolor sit amet, consectetuer adipiscing elit,it has roots </a></p>
                        <a class="comment" href="single.html"><i> </i> 0 Comments</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="late">
                    <a href="single.html" class="fashion"><img class="img-responsive " src="images/la.jpg" alt=""></a>
                    <div class="grid-product">
                        <span>6 Apr, 2015</span>
                        <p><a href="single.html"> Ipsum dolor sit amet, consectetuer adipiscing elit,it has roots </a></p>
                        <a class="comment" href="single.html"><i> </i> 0 Comments</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="late">
                    <a href="single.html" class="fashion"><img class="img-responsive " src="images/la3.jpg" alt=""></a>
                    <div class="grid-product">
                        <span>6 Apr, 2015</span>
                        <p><a href="single.html"> Ipsum dolor sit amet, consectetuer adipiscing elit,it has roots </a></p>
                        <a class="comment" href="single.html"><i> </i> 0 Comments</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!---->
<div class="footer">
    <div class="footer-middle">
        <div class="container">
            <div class="footer-middle-in">
                <h6>About us</h6>
                <p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique nisi, in interdum libero magna tristique ante. adipiscing varius. Vestibulum dolor lorem.</p>
            </div>
            <div class="footer-middle-in">
                <h6>Information</h6>
                <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Delivery Information</a></li>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms & Conditions</a></li>
                </ul>
            </div>
            <div class="footer-middle-in">
                <h6>Customer Service</h6>
                <ul>
                    <li><a href="contact.html">Contact Us</a></li>
                    <li><a href="#">Returns</a></li>
                    <li><a href="contact.html">Site Map</a></li>
                </ul>
            </div>
            <div class="footer-middle-in">
                <h6>My Account</h6>
                <ul>
                    <li><a href="#">Order History</a></li>
                    <li><a href="#">Wish List</a></li>
                    <li><a href="#">Newsletter</a></li>
                </ul>
            </div>
            <div class="footer-middle-in">
                <h6>Extras</h6>
                <ul>
                    <li><a href="#">Affiliates</a></li>
                    <li><a href="#">Specials</a></li>
                </ul>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://h2design.taobao.com/">氢设计</a></p>

</div>

</body>
</html>