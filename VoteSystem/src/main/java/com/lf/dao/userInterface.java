package com.lf.dao;
import com.lf.entity.User;

import java.util.List;
public interface userInterface {
    public List<User> findAll();
    public void addUser(User user);
    public void upDateUser(User user);
    public void deleteUser(String vu_user_name);
    public User findUserById(int id);
    public User findUserByUserName(String userName);
    public List<User> findPages(int page,int pageSize);
    public int totalPages(int pageSize);
    public int getTotalUsersNumber();
}
