package com.lf.servlet;

import com.lf.dao.UserDao;
import com.lf.entity.User;

import javax.servlet.http.HttpServlet;
import java.io.IOException;

public class AddUserServlet extends HttpServlet {
    protected void service(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
       request.setCharacterEncoding("utf8");
       response.setCharacterEncoding("utf8");
        String user_name=(String)request.getParameter("user_name");
        String user_password=(String)request.getParameter("user_password");
        String user_role_name=(String)request.getParameter("user_role_name");
        String user_phone_number=(String)request.getParameter("user_phone_number");
        if(user_name==null||user_name.length()==0||user_name.equals("")){
            request.getSession().setAttribute("loginAccountError","请输入登录用户名/手机号！");
            if(user_password==null||user_password.length()==0||user_password.equals("")){
                request.getSession().setAttribute("loginPasswordError","请输入密码！");
            }
            if(user_role_name==null||user_role_name.length()==0||user_role_name.equals("")){
                request.getSession().setAttribute("loginRoleNameError","请输入昵称！");
            }
            if(user_phone_number==null||user_phone_number.length()==0||user_phone_number.equals("")){
                request.getSession().setAttribute("loginRoleNameError","请输入手机号！");
            }
            response.sendRedirect(request.getContextPath()+"/register.jsp");
        }

        String userName = request.getParameter("user_name");
        String userPassword = request.getParameter("user_password");
        String userGender = request.getParameter("user_gender");
        String userRoleName = request.getParameter("user_role_name");
        userRoleName.getBytes("utf-8");
        String userPhoneNumber = request.getParameter("user_phone_number");
        String userVersion = request.getParameter("user_version");
        UserDao userDao = new UserDao();
//        int userId = userDao.getTotalUsersNumber();
        User user=new User(userName,userPassword,userRoleName,userPhoneNumber,userGender,userVersion);
        userDao.addUser(user);
//        request.setAttribute("LoginUserInfo",user);
        request.getSession().setAttribute("LoginUserInfo",user);
//        request.getRequestDispatcher("votepage_origin.jsp").forward(request, response);
        response.sendRedirect(request.getContextPath()+"/votes.jsp");
    }
}
