package com.icss.pojo;

public class User {
    private Integer id;
    private String username;
    private String password;
    private String phone;
    private Integer status;

    public User() {
    }

    public User(Integer id, String username, String password, String phone, Integer status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.status = status;
    }

    public User(String username, String password, String phone, Integer status) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.status = status;
    }

    public User(Integer id, String username, String password, String phone) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.phone = phone;
    }

    public User(String username, String password, String phone) {
        this.username = username;
        this.password = password;
        this.phone = phone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", status=" + status +
                '}';
    }
}
