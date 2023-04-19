package com.icss.servlet;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/upload2")
public class Upload2Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 需要检验form走是不是有enctype
        // 首先先去创建DiskFileItemFactory
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 创建fileUpload对象
        ServletFileUpload fileUpload = new ServletFileUpload(factory);
        //设置一次上传一个文件  文件的大小 最大3mb

        fileUpload.setFileSizeMax(1024*1024*3);
        // 上传总的文件大小不能超过8m
        fileUpload.setSizeMax(1024*1024*8);
        // 吧表单中的请求数据解析出来，每一个input都封着数据
        try {
            List<FileItem> fileItems=fileUpload.parseRequest(request);
                    //遍历 找到上传项
            for (FileItem fileItem : fileItems) {
                //如果是普通表单项则返回true
                if (fileItem.isFormField()){
                    // 普通表单执行普通的操作，获取提交的参数，
                    // 需要获取表单中的除了上传的其他数据 username password
                    // 获取完之后进入service dao 再去访问数据库

                }else {
                    // 不是普通表单 文件需要上传
                    System.out.println("SubmittedFileName="+fileItem.getFieldName());
                    // 获取文件大小
                    System.out.println("size="+fileItem.getSize());
                    // 获取文件input名称
                    System.out.println("name="+fileItem.getName());
                    // 获取文件的类型
                    System.out.println("ContentType="+fileItem.getContentType());
                    // 设置 路径
                    System.out.println("#####");
                    File file=new File(getServletContext().getRealPath("/upload"));
                    // 如果存在就创建该路径
                    if (!file.exists()){
                        file.mkdir();
                        System.out.println("###$$");
                    }
                    System.out.println("%%%%%%%");
                    // 设置文件名字不重名
//                    DateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//                    String fileName=sdf.format(new Date()+""+fileItem.getName());
                    DateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
                    String fileName= sdf.format(new Date())+""+fileItem.getName();
                            //存储
                    System.out.println("^^^^^^^");
                    fileItem.write(new File(file,"\\"+fileName));
                    // 删除临时信息
                    fileItem.delete();
                    System.out.println("&&&&&&&");
                    request.setAttribute("message",fileItem.getName()+"上传成功~");

                }
            }
        } catch (FileUploadException e) {
            request.setAttribute("message","上传失败~");
        } catch (Exception e) {

        }
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }
}