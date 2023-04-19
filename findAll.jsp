<%@ page import="com.icss.pojo.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icss.pojo.PageBean" %><%--
  Created by IntelliJ IDEA.
  User: 啊
  Date: 2023/4/13
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/amazeui.min.css">
    <link rel="stylesheet" href="css/admin.css">
    <style>
        body{
            /*background: url("img1/4.jpg");*/
            background-image: linear-gradient(to right,white,gray);
        }

    </style>
</head>
<body>


    <table class="am-table am-table-striped am-table-hover table-main">

        <thead>
        <tr>
            <th class="table-check"><input type="checkbox" /></th>
<%--            <th class="table-id">编号</th>--%>
            <th class="table-title">姓名</th>
            <th class="table-type">密码</th>
            <th class="table-author am-hide-sm-only">电话</th>
            <th class="table-date am-hide-sm-only">status</th>
            <th class="table-set">操作</th>
        </tr>
        </thead>
        <tbody>

        <%
            // 从requser中取出pagebean
            PageBean pageBean= (PageBean) request.getAttribute("pageBean");
            // pagebean中封装了当前所有的用户对象
            if (pageBean!=null){
                List<User> users=pageBean.getUsers();
                // 遍历
                for (User user : users) {
                    out.write("<tr>");
                    out.write("<td class='item'><input type='checkbox' name='id' value='"+user.getId()+"'></td>");
                    out.write("<td class='username'>"+user.getUsername()+"</td>");
                    out.write("<td class='password'>"+user.getPassword()+"</td>");
                    out.write("<td class='phone'>"+user.getPhone()+"</td>");
                    out.write("<td class='status'>"+user.getStatus()+"</td>");
                    /*user*/
                    out.write("<td><a class='update' href='"+request.getContextPath()+"/user?op=findById&id="+user.getId()+"'>修改</a></td>");
                    out.write("<td><a class='del' href='"+request.getContextPath()+"/user?op=delete&id="+user.getId()+"'>删除</a></td>");
                    out.write("</tr>");
                }
            }
        %>
    </table>

    <div class="page">
        <a class="previous"
                <%
                    //如果当前页是对一页，不响应
                    if (pageBean.getCurrentPage() == 1){
                        out.write("href='javascript:void(0)'");
                    }else {
                        out.write("href='"+request.getContextPath()+"/user?op=findAll&method=selectPageBean&currentPage="+(pageBean.getCurrentPage()-1)+"'");
                    }
                %>
        >&lt;
        </a>
        <%
            //获取page中的总页数
            int totalPage = pageBean.getTotalPage();
            for (int i=1;i<=totalPage;i++){
                //如果当前页面的值与当前页相同
                if (i==pageBean.getCurrentPage()){
                    //添加active类名，可以不响应点击
                    out.write("<a class='pageNum active' href='javascript:void(0)'>"+i+"</a>");
                }else {
                    out.write("<a class='pageNum' href='"+request.getContextPath()+"/user?op=findAll&method=selectPageBean&currentPage="+i+"'>"+i+"</a>");
                }
            }
        %>
        <a class="next"
                <%
//                    System.out.println( pageBean.getCurrentPage()+"@@@@");
//                    System.out.println(pageBean.getTotalPage()+"!!!!");
                    //如果当前页是最大页面
                    if (pageBean.getCurrentPage()==pageBean.getTotalPage()){
                        out.write("href='javascript:void(0)'");
                    }else {
                        out.write("href='user?op=findAll"+(pageBean.getCurrentPage()+1)+"'");
                    }
                %>
        >&gt;
        </a>
    </div>
    </tbody>
</table>
</body>
</html>
