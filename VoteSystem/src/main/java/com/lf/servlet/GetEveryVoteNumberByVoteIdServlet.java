package com.lf.servlet;

import com.lf.dao.UserDao;
import com.lf.entity.Vote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GetEveryVoteNumberByVoteIdServlet")
public class GetEveryVoteNumberByVoteIdServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        UserDao userDao = new UserDao();
        ArrayList<Vote> voteArrayList = new ArrayList<>();
        voteArrayList = (ArrayList<Vote>)request.getSession().getAttribute("voteArrayList");
        String tempVoteId="";
        for(Vote ereryVote:voteArrayList){
            tempVoteId = ereryVote.getVotesId();
            int totalVoteNumberById = userDao.getAllVotesNumberById(tempVoteId);//通过投票项目ID查询数据中所有的投票数量
            request.getSession().setAttribute(tempVoteId+"",totalVoteNumberById);
            //tempVoteId+"VoteNumber"标识不同投票项目的ID
        }
        response.sendRedirect(request.getContextPath()+"/votingList.jsp");

    }
}
