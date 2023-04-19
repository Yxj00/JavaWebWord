package com.icss.service;

import com.icss.pojo.PageBean;
import com.icss.pojo.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    /*
    查找用户名和密码
     */
    User findByUsernameAndPassword(String username,String password);

    // 管理员根据id查询
    User findById(Integer id);
    // 用户根据id查询
    User findById1(Integer id);
    // 修改
    boolean update(User user);
    // 用户可修改
    boolean update1(User user);
    // 删除
    boolean delete(Integer id);
    // 新增
    boolean insert(User user);
    // 查询用户名
    int findByUsername(String username);
    // 统计
    int countAll();

    //业务层的分页查询
    PageBean selectPageBean(int currentPage, int count);
}
