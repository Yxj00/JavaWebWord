package com.icss.dao;

import com.icss.pojo.User;

import java.util.List;

public interface UserDao {
    /*
    查询所有
     */
    List<User> selectAll();
    /*
    登录
     */
    User selectByUsernameAndPassword(String username,String password);

    /*
    根据id查询
     */
    User selectById(Integer id);
    //用户根据id查询
    User selectById1(Integer id);
    // 管理员可修改
    boolean update(User user);
    // 删除
    boolean remove(Integer id);
    // 新增
    boolean add(User user);
    int selectByUsername(String username);
    // 用户可修改
    boolean update1(User user);
    // 统计用户人数
    int countAll();

    // 查询user的总个数
    int selectCount();
    // 分页查询的抽象接口
    List<User> selectUserByLimit(int startIndex,int count);
}
