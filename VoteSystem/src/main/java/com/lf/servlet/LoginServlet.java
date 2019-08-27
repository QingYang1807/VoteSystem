package com.lf.servlet;

import com.lf.dao.UserDao;
import com.lf.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        String userName=(String)request.getParameter("user_name");
        String userPassword=(String)request.getParameter("user_password");
//        if(userName==null||userName.length()==0||userName.equals("")){
//            request.getSession().setAttribute("loginAccountError","请输入登录用户名/手机号！");
//            if(userPassword==null||userPassword.length()==0||userPassword.equals("")){
//                request.getSession().setAttribute("loginPasswordError","请输入密码！");
//            }
//            response.sendRedirect(request.getContextPath()+"/index.jsp");
//        }

        User loginUser=new User();
        loginUser.setUserName(userName);
        loginUser.setUserPassword(userPassword);
        UserDao userDao = new UserDao();
        User findUser = userDao.findUserByUserName(loginUser);

        if(findUser!=null){
            if(findUser.getUserPassword().equals(loginUser.getUserPassword())){
                request.getSession().setAttribute("LoginUserInfo",findUser);
                System.out.println(findUser.getUserRoleName()+"出场！");

                request.getRequestDispatcher("getAllVoteInfo").forward(request,response);
            }
            else{
                request.getSession().setAttribute("login_error_notice","登录密码错误！请重新登录！！！");
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
        }else{//查询用户为空
            request.getSession().setAttribute("login_error_notice","用户名不存在，请重新输入！");
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }
}
