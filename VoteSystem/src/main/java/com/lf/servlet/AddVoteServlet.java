package com.lf.servlet;

import com.lf.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AddVoteServlet")
public class AddVoteServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        String voteTicketSign = request.getParameter("voteTicketSign");//voteTicketSign所投选手的标志值
        String currentVotingId = request.getParameter("currentVotingId");//currentVotingId当前投票的项目ID

        String addFindColumnName = "vt_vote_option"+voteTicketSign;//要更新数据的数据库列名
        UserDao userDao = new UserDao();
        userDao.addVote(currentVotingId,addFindColumnName);
        response.sendRedirect(request.getContextPath()+"/getCurrentLookInfoById?currentClickVotesId="+currentVotingId);
    }
}
