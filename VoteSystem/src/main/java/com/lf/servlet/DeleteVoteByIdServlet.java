package com.lf.servlet;

import com.lf.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteVoteByIdServlet")
public class DeleteVoteByIdServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        String deleteVoteId = request.getParameter("currentClickVotesId");
        UserDao userDao = new UserDao();
        userDao.deleteVoteById(deleteVoteId);
        response.sendRedirect(request.getContextPath()+"/getAllVoteInfo");
    }
}
