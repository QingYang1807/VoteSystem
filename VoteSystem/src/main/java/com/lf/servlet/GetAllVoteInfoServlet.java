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

@WebServlet(name = "GetAllVoteInfoServlet")
public class GetAllVoteInfoServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");

        UserDao userDao = new UserDao();
        //从数据库中获取以下五个值，放进session中     2019-08-24 23：:31
        // 进行中的投票
        int votingNumber = userDao.getVotingVoteNumber();
        request.getSession().setAttribute("votingNumber",votingNumber);
        //已结束的投票
        int finishedNumber = userDao.getAllFinishedVoteNumber();
        request.getSession().setAttribute("finishedNumber",finishedNumber);
        //总投票数量//查询数据中所有的投票数量
         int totalVoteNumber = userDao.getAllVotesNumber();//查询数据中所有的投票数量
         request.getSession().setAttribute("totalVoteNumber",totalVoteNumber);
        //总访问量
//                int totalEnterNumber = userDao.getTotalEnterNumber();
        //已完成的投票

        //数据库中所有创建的的投票信息
        ArrayList<Vote> voteArrayList = new ArrayList<>();
        voteArrayList = userDao.getAllVoteInfo();
        request.getSession().setAttribute("voteArrayList",voteArrayList);

        response.sendRedirect(request.getContextPath()+"/votes.jsp");
    }
}
