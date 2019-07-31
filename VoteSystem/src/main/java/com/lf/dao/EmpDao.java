package com.lf.dao;

import com.lf.entity.User;
import com.lf.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements userInterface {

    @Override
    public List<User> findAll() {
        List<User> users=new ArrayList<User>();
        Connection con= DBUtil.getConnection();
        String sql="select *from vote_user";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                User user=new User();
                user.setUserId(rs.getInt("vu_user_id"));
                user.setUserName(rs.getString("vu_user_name"));
                user.setUserPassword(rs.getString("vu_user_password"));
                user.setUserRoleName(rs.getString("vu_user_role_name"));
                user.setUserPhoneNumber(rs.getString("vu_user_phone_number"));
                user.setUserGender(rs.getString("vu_user_gender"));
                user.setUserStatus(rs.getInt("vu_user_status"));
                user.setUserVersion(rs.getString("vu_user_version"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public void addUser(User user) {
        int code=-1;
        Connection con=DBUtil.getConnection();
        String sql="insert into vote_user(vu_user_id,vu_user_name,vu_user_password,vu_user_role_name" +
                "vu_user_phone_number,vu_user_gender,vu_user_status,vu_user_version)values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            int totalUsersNumber=this.getTotalUsersNumber();//获取当前vote_user表中所有用户数，用于生成计算id值
            if(totalUsersNumber==-1){System.out.println("数据库查询出错！请联系开发人员，或重新执行您的操作！");}
            else{
                System.out.println("数据库查询用户数为【"+totalUsersNumber+"】");
                totalUsersNumber++;
            }
            ps.setInt(1,totalUsersNumber);//当前总用户数+1后代表的id
            ps.setString(2,user.getUserName());
            ps.setString(3,user.getUserPassword());
            ps.setString(4,user.getUserRoleName());
            ps.setString(5, user.getUserPhoneNumber());
            ps.setString(6, user.getUserGender());
            ps.setInt(7, user.getUserStatus());
            ps.setString(8, user.getUserVersion());
            code= ps.executeUpdate();
            System.out.println("数据添加成功！【用户注册成功！code:"+code+"】");
        } catch (SQLException e) {
            System.out.println("数据添加失败！【用户注册失败！code:"+code+"】");
            e.printStackTrace();
        }
    }

    @Override
    public void upDateUser(User user) {
        int code=-1;
        Connection con=DBUtil.getConnection();
        String sql="update vote_user set vu_user_name=?,vu_user_password=?,vu_user_role_name=?," +
                "vu_user_phone_number=?,vu_user_gender=?,vu_user_status=?,vu_user_version=? where vu_user_name=?";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,user.getUserName());
            ps.setString(2,user.getUserPassword());
            ps.setString(3,user.getUserRoleName());
            ps.setString(4, user.getUserPhoneNumber());
            ps.setString(5, user.getUserGender());
            ps.setInt(6, user.getUserStatus());
            ps.setString(7, user.getUserVersion());
            code=ps.executeUpdate();
            System.out.println("用户信息修改成功！【code:"+code+"】");
        } catch (SQLException e) {
            System.out.println("用户信息修改失败！【code:"+code+"】");
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUser(String vu_user_name) {
        int code=-1;
        Connection con=DBUtil.getConnection();
        String sql="delete from vote_user where vu_user_name=?";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, vu_user_name);
            code=ps.executeUpdate();
            System.out.println("用户:【"+vu_user_name+"】删除成功！+【code:"+code+"】");
        } catch (SQLException e) {
            System.out.println("用户:【"+vu_user_name+"】删除失败！+【code:"+code+"】");
            e.printStackTrace();
        }
    }

    @Override
    public User findUserById(int id) {
        Connection con=DBUtil.getConnection();
        String sql="select * from vote_user where id=?";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs= ps.executeQuery();
            if(rs.next()){
                User user=new User();
                user.setUserId(rs.getInt("vu_user_id"));
                user.setUserName(rs.getString("vu_user_name"));
                user.setUserPassword(rs.getString("vu_user_password"));
                user.setUserRoleName(rs.getString("vu_user_role_name"));
                user.setUserPhoneNumber(rs.getString("vu_user_phone_number"));
                user.setUserGender(rs.getString("vu_user_gender"));
                user.setUserStatus(rs.getInt("vu_user_status"));
                user.setUserVersion(rs.getString("vu_user_version"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public User findUserByUserName(String userName) {
        Connection con=DBUtil.getConnection();
        String sql="select * from vote_user where id=?";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,userName);
            ResultSet rs= ps.executeQuery();
            if(rs.next()){
                User user=new User();
                user.setUserId(rs.getInt("vu_user_id"));
                user.setUserName(rs.getString("vu_user_name"));
                user.setUserPassword(rs.getString("vu_user_password"));
                user.setUserRoleName(rs.getString("vu_user_role_name"));
                user.setUserPhoneNumber(rs.getString("vu_user_phone_number"));
                user.setUserGender(rs.getString("vu_user_gender"));
                user.setUserStatus(rs.getInt("vu_user_status"));
                user.setUserVersion(rs.getString("vu_user_version"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> findPages(int page, int pageSize) {
        List<User> users=new ArrayList<User>();
        Connection con=DBUtil.getConnection();
        String sql="select * from vote_user limit ?,?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, (page-1)*pageSize);
            ps.setInt(2,pageSize);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
                User user=new User();
                user.setUserId(rs.getInt("vu_user_id"));
                user.setUserName(rs.getString("vu_user_name"));
                user.setUserPassword(rs.getString("vu_user_password"));
                user.setUserRoleName(rs.getString("vu_user_role_name"));
                user.setUserPhoneNumber(rs.getString("vu_user_phone_number"));
                user.setUserGender(rs.getString("vu_user_gender"));
                user.setUserStatus(rs.getInt("vu_user_status"));
                user.setUserVersion(rs.getString("vu_user_version"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public int totalPages(int pageSize) {
        Connection con=DBUtil.getConnection();
        String sql="select count(*) num from vote_user";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                int num=rs.getInt("num");
                if(num%pageSize==0){
                    return num/pageSize;
                }else{
                    return num/pageSize+1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int getTotalUsersNumber(){//获取vote_user表里所有用户数
        Connection con = DBUtil.getConnection();
        String sql="select count(*) from vote_user";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                int totalUserNumber=rs.getInt(1);
                return totalUserNumber;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
