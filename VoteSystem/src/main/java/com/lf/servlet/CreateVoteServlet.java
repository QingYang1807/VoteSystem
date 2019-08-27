package com.lf.servlet;

import com.lf.dao.UserDao;
import com.lf.entity.Vote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateVoteServlet")
public class CreateVoteServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");

        String voteId = request.getParameter("votes_id");
        String votesName = request.getParameter("votes_name");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String contentVoteDesc = request.getParameter("content_vote_desc");
        String voteOption1 = request.getParameter("vote_Option_1");
        String voteOption2 = request.getParameter("vote_Option_2");
        String voteOption3 = request.getParameter("vote_Option_3");
        String voteOption4 = request.getParameter("vote_Option_4");

        Vote vote = new Vote(voteId,votesName,startDate,endDate,
                contentVoteDesc,voteOption1,voteOption2,voteOption3,voteOption4,"投票中");

        UserDao userDao = new UserDao();
        userDao.createVote(vote);
        request.getRequestDispatcher("getAllVoteInfo").forward(request,response);
//        response.sendRedirect(request.getContextPath()+"/votes.jsp");

    }
}
