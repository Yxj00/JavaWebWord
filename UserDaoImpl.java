package com.icss.dao.impl;

import com.icss.dao.UserDao;
import com.icss.pojo.User;
import com.icss.util.DBUtil;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {
    /* 实现数据链路层 连接数据库操作数据
     实例化方法*/
    DBUtil db=null;
    Statement stmt=null;
    PreparedStatement prep=null;
    ResultSet rs=null;
    @Override
    public List<User> selectAll() {
//        创建一个用于存储查询数据的一个集合
        List<User> list=new ArrayList<>();
        // 加载驱动
        try {
            db=new DBUtil();
            stmt= db.getStmt();
            // 创建查询语句
            String sql="select * from user";
            // 获取结果集
            rs=stmt.executeQuery(sql);
            // 遍历数据
            while (rs.next()){
                list.add(new User(rs.getInt("id"),rs.getString("username"),
                        rs.getString("password"),rs.getString("phone"),rs.getInt("status")));
            }
            return list;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null)rs.close();
                if (stmt!=null)stmt.close();
                if (db!=null)db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    public User selectByUsernameAndPassword(String username, String password) {
        try {
            db=new DBUtil();
            prep= db.getPrep("select * from user where username=? and password=? ");
            prep.setString(1,username);
            prep.setString(2,password);
            rs=prep.executeQuery();
            while (rs.next()){
                User user=new User(rs.getInt("id"),rs.getString("username"),rs.getString("password"),rs.getString("phone"),rs.getInt("status"));
                return user;
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null)rs.close();
                if (prep!=null)  prep.close();
                if (db!=null) db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        return null;
    }

    @Override
    public User selectById(Integer id) {
        try {
            db=new DBUtil();
            prep=db.getPrep("select * from user where id=?");
            prep.setInt(1,id);
            rs=prep.executeQuery();
            while (rs.next()){
                User user=new User(rs.getInt("id"),rs.getString("username"),
                        rs.getString("password"),rs.getString("phone"),rs.getInt("status"));
                return user;
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null)rs.close();
                if (prep!=null)  prep.close();
                if (db!=null) db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        return null;
    }

    @Override
    public User selectById1(Integer id) {
        try {
            db=new DBUtil();
            prep=db.getPrep("select * from user where id=?");
            prep.setInt(1,id);
            rs=prep.executeQuery();
            while (rs.next()){
                User user=new User(rs.getInt("id"),rs.getString("username"),
                        rs.getString("password"),rs.getString("phone"),rs.getInt("status"));
                return user;
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null)rs.close();
                if (prep!=null)  prep.close();
                if (db!=null) db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        return null;
    }

    @Override
    public boolean update(User user) {
        try {
            db=new DBUtil();
            prep= db.getPrep("update user set username=?,password=?,phone=?,status=? where id=?");
            prep.setString(1,user.getUsername());
            prep.setString(2,user.getPassword());
            prep.setString(3,user.getPhone());
            prep.setInt(4,user.getStatus());
            prep.setInt(5,user.getId());
            prep.executeUpdate();
            return true;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null)rs.close();
                if (prep!=null)  prep.close();
                if (db!=null) db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

    }

    @Override
    public boolean remove(Integer id) {
        try {
            db=new DBUtil();
            prep= db.getPrep("delete from user where id=?");
            prep.setInt(1,id);
            prep.executeUpdate();
            return true;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null)rs.close();
                if (prep!=null)  prep.close();
                if (db!=null) db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    public boolean add(User user) {
        try {
            db=new DBUtil();
            prep=db.getPrep("insert into user(username,password,phone) values(?,?,?)");
            prep.setString(1,user.getUsername());
            prep.setString(2,user.getPassword());
            prep.setString(3,user.getPhone());
            prep.executeUpdate();
            return true;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (prep!=null)  prep.close();
                if (db!=null) db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public int selectByUsername(String username) {
        try {
            db=new DBUtil();
            prep= db.getPrep("select * from user where username=?");
            prep.setString(1,username);
            rs = prep.executeQuery();
            while (rs.next()){
                return 1;
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null)rs.close();
                if (prep!=null)  prep.close();
                if (db!=null) db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return 0;
    }

    @Override
    public boolean update1(User user) {
        try {
            db=new DBUtil();
            prep= db.getPrep("update user set username=?,password=?,phone=? where id=?");
            prep.setString(1,user.getUsername());
            prep.setString(2,user.getPassword());
            prep.setString(3,user.getPhone());
            prep.setInt(4,user.getId());
            prep.executeUpdate();
            return true;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null)rs.close();
                if (prep!=null)  prep.close();
                if (db!=null) db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

    }

    @Override
    public int countAll() {
        List<User> users=new ArrayList<>();
        try {
            db=new DBUtil();
            stmt= db.getStmt();
            String sql="select * from user";
            rs=stmt.executeQuery(sql);
            int count=0;
            while (rs.next()){
                users.add(new User(rs.getInt("id"),rs.getString("username"),
                        rs.getString("password"),rs.getString("phone"),rs.getInt("status")));
                count++;
            }
            return count;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null)rs.close();
                if (prep!=null)  prep.close();
                if (db!=null) db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    public int selectCount() {
        try {
            db=new DBUtil();
            prep =db.getPrep("select count(*) totalCount from user");
            rs=prep.executeQuery();
            while (rs.next()){
                // 这里获取到数据
                // 通过列的顺序，顺序指的是select后面的数据
                // 字段顺序
                return rs.getInt(1);
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null) rs.close();
                if (prep!=null) prep.close();
                if (db!=null)db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return 0;
    }

    @Override
    public List<User> selectUserByLimit(int startIndex, int count) {
        try {
            db=new DBUtil();
            prep= db.getPrep("select * from user limit ?,?");
            prep.setInt(1,startIndex);
            prep.setInt(2,count);
            rs=prep.executeQuery();
            List<User> list=new ArrayList<>();
            while (rs.next()){
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));

                user.setPhone(rs.getString("phone"));
                user.setStatus(rs.getInt("status"));
                list.add(user);
            }
            return list;

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            try {
                if (rs!=null) rs.close();
                if (prep!=null) prep.close();
                if (db!=null)db.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

}

