package com.icss.service.impl;

import com.icss.dao.UserDao;
import com.icss.dao.impl.UserDaoImpl;
import com.icss.pojo.PageBean;
import com.icss.pojo.User;
import com.icss.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    // 设置和数据链路层的一个连接 dao
    private UserDao dao=new UserDaoImpl();
    @Override
    public List<User> findAll() {
        return this.dao.selectAll();
    }

    @Override
    public User findByUsernameAndPassword(String username, String password) {
        return this.dao.selectByUsernameAndPassword(username,password);
    }

    @Override
    public User findById(Integer id) {
        return this.dao.selectById(id);
    }

    @Override
    public User findById1(Integer id) {
        return this.dao.selectById1(id);
    }

    @Override
    public boolean update(User user) {
        return this.dao.update(user);
    }

    @Override
    public boolean delete(Integer id) {
        return this.dao.remove(id);
    }

    @Override
    public boolean insert(User user) {
        return this.dao.add(user);
    }

    @Override
    public int findByUsername(String username) {
        return this.dao.selectByUsername(username);
    }

    @Override
    public int countAll() {
        return this.dao.countAll();
    }

    @Override
    public boolean update1(User user) {
        return this.dao.update1(user);
    }

    @Override
    public PageBean selectPageBean(int currentPage, int count) {
        /**
         *分页查询，要的的结果pageBean
         * 在service 中要封装pageBean 对象中的属性要借助dao实现
         * currentPage 当前页查询第几页
         */
        // 创建pageBean
        PageBean pageBean = new PageBean();
        // 封装第几页
        pageBean.setCurrentPage(currentPage);
        // 封装count 每页显示几条数据
        pageBean.setCount(count);
        // 封装总的条数
        int totalCount = dao.selectCount();
        pageBean.setTotalCount(totalCount);
        pageBean.setTotalPage((int) Math.ceil((double) totalCount/count));
        // 封装当前所有的用户列表，分页查询
        List<User> users=dao.selectUserByLimit((currentPage-1)*count,count);
        pageBean.setUsers(users);
        // 返回page
        return pageBean;
    }
}
