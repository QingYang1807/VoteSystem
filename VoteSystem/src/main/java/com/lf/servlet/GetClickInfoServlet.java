package com.lf.servlet;

import com.lf.dao.UserDao;
import com.lf.entity.Vote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetClickInfoServlet")
public class GetClickInfoServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        String clickVotesID = request.getParameter("currentClickVotesId");
        request.getSession().setAttribute("currentActiveVoteId",clickVotesID);
        UserDao userDao = new UserDao();
        Vote clickVotesInfo = userDao.getVoteTicketInfoByID(clickVotesID);
        request.getSession().setAttribute("clickVotesInfo",clickVotesInfo);
        response.sendRedirect(request.getContextPath()+"/editClickVote.jsp");
    }
}
