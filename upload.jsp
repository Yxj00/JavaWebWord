<%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/4/12
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
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
            height: 400px;
            /*background-color: #00000060;*/
            background: url("img1/4.jpg");
            margin: auto;
            margin-top: 10%;
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
            width: 80%;
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
        textarea{
            width: 80%;
            margin-top: 25px;
            height: 150px;
        }
    </style>
</head>
<body>
<form action="upload2" method="post" enctype="multipart/form-data">
    <div id="login_box">
        <h2>上传游戏</h2>
        <div id="input_box">
            <input type="text" name="username" placeholder="请输入游戏名称"><br>
        </div>
        <div class="input_box">
            <input type="file" name="fileUpload"><br>
        </div>

            <textarea placeholder="请输入对游戏的描述"></textarea>

        <button type="submit">上传</button><br>
    </div>
</form>
</body>
</html>
