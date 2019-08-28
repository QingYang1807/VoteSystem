package com.lf.servlet;

import com.lf.dao.UserDao;
import com.lf.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ModifyUserInfoServlet")
public class ModifyUserInfoServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
//        String votesIdStr = request.getParameter("votes_id");
//        int votesId = Integer.parseInt(votesIdStr);
        String userName = request.getParameter("user_name");
        String userPassword = request.getParameter("user_password");
        String userRoleName = request.getParameter("user_role_name");
        String userPhoneNumber = request.getParameter("user_phone_number");
        String userGender = request.getParameter("user_gender");
        String userVersion = request.getParameter("user_version");
        User user = new User(userName,userPassword,userRoleName,userPhoneNumber,userGender,1,userVersion);
        UserDao userDao = new UserDao();
        userDao.upDateUser(user);
        request.getSession().setAttribute("mofidifyErrorNotice","恭喜修改成功！");
        response.sendRedirect(request.getContextPath()+"/getCurrentLoginUserInfo");
    }
}
