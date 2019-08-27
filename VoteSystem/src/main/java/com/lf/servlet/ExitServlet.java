package com.lf.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ExitServlet")
public class ExitServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("LoginUserInfo")!=null){
            session.removeAttribute("LoginUserInfo");
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }else{
            response.sendRedirect(request.getContextPath()+"/login.jsp");
        }
    }
}
