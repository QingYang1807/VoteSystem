package com.lf.servlet;

import com.lf.dao.UserDao;
import com.lf.entity.Vote;
import com.lf.entity.VoteInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetCurrentLookInfoByIdServlet")
public class GetCurrentLookInfoByIdServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        String currentLookingVoteId = request.getParameter("currentClickVotesId");//currentClickVotesId
        UserDao userDao = new UserDao();
        Vote vote = userDao.getVoteTicketInfoByID(currentLookingVoteId);//获取当前点击过来的Id投票项目的投票  信息
        VoteInfo voteInfo = userDao.getVoteNmberInfoByID(currentLookingVoteId);//获取当前点击过来的Id投票项目的  票数
        request.getSession().setAttribute("currentLookingVoteInfo",vote);
        request.getSession().setAttribute("currentLookingVoteNumberInfo",voteInfo);
        response.sendRedirect(request.getContextPath()+"/votepage.jsp");
    }
}
