<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/4/12
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/jquery-1.12.4.js"></script>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<%--<h1>注册账号</h1>--%>
<form action="user?op=add" method="post" id="add">
    <div id="login_box">
        <h2>注册</h2>
        <div id="input_box">
            <input type="text" name="username" id="username" placeholder="请输入用户名">
            <div><span class="usernameInfo"></span></div>
        </div>
        <div class="input_box">
            <input type="password" name="password" id="password" placeholder="请输入密码">
        </div>
        <div class="input_box">
            <input type="text" name="phone" id="phone" placeholder="请输入手机号码">
        </div>
        <%--        <button type="submit" >注册</button><br>--%>
        <%--        <button type="button" onclick="check()">注册</button><br>--%>
        <button type="button" onclick="check()" id="z">注册</button>
        <br>
        <%--        <button href="index.jsp">有账号，返回登录</button>--%>
    </div>
</form>
<script>
    function check() {
        var name = document.getElementById("username");
        var pwd = document.getElementById("password");
        var phone = document.getElementById("phone");
        if (name.value === '') {
            alert('用户名不能为空!');
            name.focus();
            return false;
        } else if (pwd.value === '') {
            alert('密码不能为空!');
            pwd.focus();
            return false;
        } else if (phone.value === '') {
            alert('电话不能为空!');
            phone.focus();
            return false;
        }
        document.getElementById("add").submit();
    }

    $("#username").blur(function (){

            $.ajax({
                type: "get",
                // url:"user?op=reg&username="+$(this).val(),
                url: "user?op=reg&username=" + name,
                // success: function (data) {
              success: function (data) {
                    // 设置返回的提示信息span内

                       $(".usernameInfo").text(data.usernameInfo);

                },
                dataType: "json"
            })

    })

    //在页面加载完成后
    // $(function () {
    //     // 给username绑定失去焦点事件
    //     $("#username").blur(function () {
    //         // 获取username文本输入的值
    //         var username = $(this).val();
    //         // 发送ajax请求
    //         $.get("user?op=reg&username=", {username: username}, function (data) {
    //             var span = $(".usernameInfo");
    //             // 判断userExist键的值是否为true
    //             if (data.userExist) {
    //                 // 用户名存在
    //                 span.css("color", "red");
    //                 span.html(data.msg);
    //             } else {
    //                 // 用户名不存在
    //                 span.css("color", "green");
    //                 span.html(data.msg);
    //             }
    //         }, "json");
    //     });
    // });

</script>
</body>
</html>
