package com.lf.servlet;

import com.lf.dao.UserDao;
import com.lf.entity.Vote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateVoteDataServlet")
public class UpdateVoteDataServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        String votesId = request.getParameter("votes_id");
        String votesName = request.getParameter("votes_name");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String contentVoteDesc = request.getParameter("content_vote_desc");
        String voteOption1 = request.getParameter("vote_Option_1");
        String voteOption2 = request.getParameter("vote_Option_2");
        String voteOption3 = request.getParameter("vote_Option_3");
        String voteOption4 = request.getParameter("vote_Option_4");
        String voteStatus = request.getParameter("vote_status");
        Vote vote = new Vote(votesId,votesName,startDate,endDate,
                contentVoteDesc,voteOption1,voteOption2,voteOption3,voteOption4,voteStatus);
        UserDao userDao = new UserDao();
        userDao.modifyVoteInfo(vote);
        response.sendRedirect(request.getContextPath()+"/getAllVoteInfo");
    }
}
