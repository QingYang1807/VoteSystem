package com.lf.dao;

import com.lf.entity.User;
import com.lf.entity.Vote;
import com.lf.entity.VoteInfo;

import java.util.ArrayList;
import java.util.List;
public interface userInterface {
    public List<User> findAll();
    public void addUser(User user);
    public void upDateUser(User user);
    public void deleteUser(String vu_user_name);
    public User findUserById(int id);
    public User findUserByUserName(User findUser);
    public List<User> findPages(int page,int pageSize);
    public int totalPages(int pageSize);
    public int getTotalUsersNumber();

    /*新建投票  子功能*/
    public void createVote(Vote vote);//创建投票

    public ArrayList<Vote> getAllVoteInfo();//获取所有数据库中创建的投票，用于查看和管理删除。。。
    public ArrayList<Vote> getVoteInDifferentStatus(String status);//获取不同状态下的   投票信息 共通方法
    public ArrayList<Vote> getVotingVote();//获取正在投票的投票信息
    public ArrayList<Vote> getAllFinishedVote();//获取所有已结束的投票信息

    public int getVoteNumberInDifferentStatus(String status);//获取不同状态下的  投票信息数量的共通方法
    public int getVotingVoteNumber();//获取正在投票的投票信息  的数量
    public int getAllFinishedVoteNumber();//获取所有已结束的投票信息   的数量

    public int getDifferentItemsVotedNumber(String itemName);//获取不同项的投票数
    public int getTotalEnterNumber(String itemName);//总访问量

    public int getAllVotesNumber();//获取总投票数量

    public Vote getVoteTicketInfoByID(String votesId);//通过投票ID查找此投票项目所有信息
    public VoteInfo getVoteNmberInfoByID(String votesId);//通过Id获取
    public void modifyVoteInfo(Vote vote);//通过Id修改、更新投票信息
    public void deleteVoteById(String deleteVoteId);//通过Id删除投票信息

    public int getVoteNumberByColumnName(String currentVotingId,String columnName);//通过列名查询对应投票项目ID的票数
    public void addVote(String currentVotingId,String addFindColumnName);//通过Id增加投票数+1
}
