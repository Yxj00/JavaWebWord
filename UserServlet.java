package com.icss.servlet;

import com.alibaba.fastjson.JSONObject;
import com.icss.pojo.PageBean;
import com.icss.pojo.User;
import com.icss.service.UserService;
import com.icss.service.impl.UserServiceImpl;
import sun.plugin.dom.core.Element;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@WebServlet("/user")
//public class UserServlet extends HttpServlet {
public class UserServlet extends BaseServlet{
    // 控制层要和业务层绑定
    private UserService service=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 接收页面传递的数据
        String op = request.getParameter("op");
        int countAll = this.service.countAll();
        request.setAttribute("countAll",countAll);
        if ("admin".equals(op)){
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User user=this.service.findByUsernameAndPassword(username,password);
            request.setAttribute("user",user);
            if ("admin".equals(username)&&"admin".equals(password)){
                request.getRequestDispatcher("admin.jsp").forward(request,response);
            }else  if (user!=null){
                // 判断是否勾选了下次是否自动登录
                String autoLogin = request.getParameter("autoLogin");
//                System.out.println(autoLogin);
                // 如果勾选了，结果返回auto 如果没有勾选 结果返回null
                if ("auto".equals(autoLogin)){
//                    System.out.println(autoLogin);
                    // 需要将用户信息存入到cookie，响应给客户端 key: username:password
                    Cookie autoLogin_cookie = new Cookie("loginInfo", username + ":" + password);
                    // 不限制时间
                    autoLogin_cookie.setMaxAge(Integer.MAX_VALUE);
                    response.addCookie(autoLogin_cookie);
//                    return;
                }else {
                    // 没有勾选 自动登录销毁cookie
                    Cookie autoLogin_cookie = new Cookie("loginInfo", "");
                    // 设置时长
                    autoLogin_cookie.setMaxAge(1);
                    // 响应给客户端
                    response.addCookie(autoLogin_cookie);
                }
                if (user.getStatus()==1||user.getStatus()==2){
                    request.getRequestDispatcher("login.jsp").forward(request,response);
                }
            }
            request.setAttribute("message","账户不存在或账户密码错误~");
            request.getRequestDispatcher("index.jsp").forward(request,response);

        } else if ("findAll".equals(op)) {
//            // 查询所有方法
//            List<User> all = this.service.findAll();
//            // 设置请求信息
//            request.setAttribute("all",all);
            // 请求转发给页面
            // 获取当前展示的页码
            String current_page = request.getParameter("currentPage");
            // 声明一个当前展示页码
            int currentPage=1;
            // 声明一个每页显示几条数据
            int count=4;
            // 不为空，并且不是“”
            if (current_page!=null&&!"".equals(current_page)){
                // string 转为 int
                currentPage=Integer.parseInt(current_page);
            }
            //每页显示固定的个数
            UserService service=new UserServiceImpl();
            PageBean pageBean=service.selectPageBean(currentPage,count);
            // 将pageBean返回给客户端
            request.setAttribute("pageBean",pageBean);
            request.getRequestDispatcher("findAll.jsp").forward(request,response);

        } else if ("findById".equals(op)) {
           int id= Integer.parseInt(request.getParameter("id"));
            User user=this.service.findById(id);
            request.setAttribute("user",user);
            request.getRequestDispatcher("update.jsp").forward(request,response);
        } else if ("update".equals(op)) {
            Integer id=Integer.valueOf(request.getParameter("id"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            Integer status = Integer.valueOf(request.getParameter("status"));
           boolean flag=this.service.update(new User(id,username,password,phone,status));
            if (flag){
                request.setAttribute("message","修改成功~");
                request.getRequestDispatcher("error.jsp").forward(request,response);
            }else {
                request.setAttribute("message","修改失败~回去吧");
                request.getRequestDispatcher("error.jsp").forward(request,response);
            }
        }else if ("delete".equals(op)) {
            Integer id=Integer.valueOf(request.getParameter("id"));
            boolean flag = this.service.delete(id);
            if (flag==true){
                request.setAttribute("message","删除成功~");
                request.getRequestDispatcher("error.jsp").forward(request,response);
            }else {
                request.setAttribute("message","删除失败~");
                request.getRequestDispatcher("error.jsp").forward(request,response);
            }
        } else if ("add".equals(op)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            boolean flag = this.service.insert(new User(username,password,phone));
            if (flag){
                request.setAttribute("message","注册成功,请登录~");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }else {
                request.setAttribute("message","注册失败");
                request.getRequestDispatcher("error1.jsp").forward(request,response);
            }
        } else if ("reg".equals(op)) {
            String username = request.getParameter("username");
            int res = this.service.findByUsername(username);
            // 创建json对象
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("usernameInfo","用户名可以使用");
            if (res==1){
                jsonObject.put("usernameInfo","用户名已存在");
            }
            response.getWriter().write(jsonObject.toJSONString());
        }else if ("findById1".equals(op)) {
            int id= Integer.parseInt(request.getParameter("id"));
            User user=this.service.findById1(id);
            request.setAttribute("user",user);
            request.getRequestDispatcher("update1.jsp").forward(request,response);
        } else if ("update1".equals(op)) {
            Integer id=Integer.valueOf(request.getParameter("id"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            boolean flag=this.service.update1(new User(id,username,password,phone));
            if (flag){
                request.setAttribute("message","修改成功~");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }else {
                request.setAttribute("message","修改失败~回去吧");
                request.getRequestDispatcher("error.jsp").forward(request,response);
            }
        }


    }
}
