package com.lf.servlet;

import com.lf.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "JudgeHasNotSessionServlet")
public class JudgeHasNotSessionServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User tempUser = (User)session.getAttribute("LoginUserInfo");
//        System.out.println(tempUser.getUserRoleName()+"JudgeHasNotSessionServlet____out");
        if(tempUser==null){
            session.setAttribute("reLoginInfo","0");//0：未登录
            session.setAttribute("loginError","请登录！");
            System.out.println(tempUser.getUserRoleName()+"in");
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
        response.sendRedirect(request.getContextPath()+"/votes.jsp");
    }
}
