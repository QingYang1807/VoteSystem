package com.lf.servlet;

import com.lf.dao.UserDao;
import com.lf.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetCurrentLoginUserInfoServlet")
public class GetCurrentLoginUserInfoServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        UserDao userDao = new UserDao();
        User user = (User)request.getSession().getAttribute("LoginUserInfo");
        User lastestUserInfo = userDao.findUserByUserName(user);
        request.getSession().setAttribute("LoginUserInfo",lastestUserInfo);
        response.sendRedirect(request.getContextPath()+"/editUserInfo.jsp");
    }
}
