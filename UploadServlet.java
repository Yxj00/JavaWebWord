package com.icss.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //实现上传接口，创建对象 表单中的name值
        Part part=request.getPart("fileUpload");
        /*
        我们可以调用part接口中的方法
        获取文件名称
         */
        System.out.println("SubmittedFileName="+part.getSubmittedFileName());
        // 获取文件大小
        System.out.println("size="+part.getSize());
        // 获取文件input名称
        System.out.println("name="+part.getName());
        // 获取文件的类型
        System.out.println("ContentType="+part.getContentType());
        /*
        获取输入流
        规定文件格式jpg、、png
         */
        if (part.getSubmittedFileName().toLowerCase().endsWith(".jpg")||part.getSubmittedFileName().toLowerCase().endsWith(".png")){
            /*
            如果格式正确 上传
            找个路径存储
             */
            String realPath = getServletContext().getRealPath("/upload");
            // 创建file对象
            File file = new File(realPath);
            // 创建路径
            if (!file.exists()){
                file.mkdir();
            }
            // 为图片设置不重复的名字
            String fileName= UUID.randomUUID().toString().replaceAll("-","")+
                    part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf("."));
            // 存储文件
            part.write(realPath+"/"+fileName);
            //删除临时文件
            part.delete();
            request.setAttribute("message",part.getSubmittedFileName()+"上传成功~");
        }else {
            request.setAttribute("message","上传失败 只能接收jpg或png格式");
        }
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }
}
