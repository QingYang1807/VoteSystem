package com.lf.dao;

import com.lf.entity.User;
import com.lf.entity.Vote;
import com.lf.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao implements userInterface {

    @Override
    public List<User> findAll() {
        List<User> users=new ArrayList<User>();
        Connection con= DBUtil.getConnection();
        String sql="select *from vote_user";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                User user=new User();
                user.setUserId(rs.getInt("vu_user_id"));
                user.setUserName(rs.getString("vu_user_name"));
                user.setUserPassword(rs.getString("vu_user_password"));
                user.setUserRoleName(rs.getString("vu_user_role_name"));
                user.setUserPhoneNumber(rs.getString("vu_user_phone_number"));
                user.setUserGender(rs.getString("vu_user_gender"));
                user.setUserStatus(rs.getInt("vu_user_status"));
                user.setUserVersion(rs.getString("vu_user_version"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public void addUser(User user) {
        int code=-1;
        Connection con=DBUtil.getConnection();
        String sql="insert into vote_user(vu_user_id,vu_user_name,vu_user_password,vu_user_role_name," +
                "vu_user_phone_number,vu_user_gender,vu_user_status,vu_user_version)values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            int totalUsersNumber=this.getTotalUsersNumber();//获取当前vote_user表中所有用户数，用于生成计算id值
            if(totalUsersNumber==-1){System.out.println("数据库查询出错！请联系开发人员，或重新执行您的操作！");}
            else{
                System.out.println("数据库查询用户数为【"+totalUsersNumber+"】");
                totalUsersNumber++;
            }
            ps.setInt(1,totalUsersNumber);//当前总用户数+1后代表的id
            ps.setString(2,user.getUserName());
            ps.setString(3,user.getUserPassword());
            ps.setString(4,user.getUserRoleName());
            ps.setString(5, user.getUserPhoneNumber());
            ps.setString(6, user.getUserGender());
            ps.setInt(7, 1);//默认为1，非冻结，可使用状态
            ps.setString(8, user.getUserVersion());
            code= ps.executeUpdate();
            System.out.println("数据添加成功！【用户注册成功！code:"+code+"】");
        } catch (SQLException e) {
            System.out.println("数据添加失败！【用户注册失败！code:"+code+"】");
            e.printStackTrace();
        }
    }

    @Override
    public void upDateUser(User user) {
        int code=-1;
        Connection con=DBUtil.getConnection();
        String sql="update vote_user set vu_user_name=?,vu_user_password=?,vu_user_role_name=?," +
                "vu_user_phone_number=?,vu_user_gender=?,vu_user_status=?,vu_user_version=? where vu_user_name=?";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,user.getUserName());
            ps.setString(2,user.getUserPassword());
            ps.setString(3,user.getUserRoleName());
            ps.setString(4, user.getUserPhoneNumber());
            ps.setString(5, user.getUserGender());
            ps.setInt(6, user.getUserStatus());
            ps.setString(7, user.getUserVersion());
            code=ps.executeUpdate();
            System.out.println("用户信息修改成功！【code:"+code+"】");
        } catch (SQLException e) {
            System.out.println("用户信息修改失败！【code:"+code+"】");
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUser(String vu_user_name) {
        int code=-1;
        Connection con=DBUtil.getConnection();
        String sql="delete from vote_user where vu_user_name=?";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, vu_user_name);
            code=ps.executeUpdate();
            System.out.println("用户:【"+vu_user_name+"】删除成功！+【code:"+code+"】");
        } catch (SQLException e) {
            System.out.println("用户:【"+vu_user_name+"】删除失败！+【code:"+code+"】");
            e.printStackTrace();
        }
    }

    @Override
    public User findUserById(int id) {
        Connection con=DBUtil.getConnection();
        String sql="select * from vote_user where id=?";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs= ps.executeQuery();
            if(rs.next()){
                User user=new User();
                user.setUserId(rs.getInt("vu_user_id"));
                user.setUserName(rs.getString("vu_user_name"));
                user.setUserPassword(rs.getString("vu_user_password"));
                user.setUserRoleName(rs.getString("vu_user_role_name"));
                user.setUserPhoneNumber(rs.getString("vu_user_phone_number"));
                user.setUserGender(rs.getString("vu_user_gender"));
                user.setUserStatus(rs.getInt("vu_user_status"));
                user.setUserVersion(rs.getString("vu_user_version"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    @Override
    public User findUserByUserName(User findUser) {
        Connection con=DBUtil.getConnection();
        String sql="select * from vote_user where vu_user_name=?";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,findUser.getUserName());
            ResultSet rs= ps.executeQuery();
            if(rs.next()){
                User user=new User();
                user.setUserId(rs.getInt("vu_user_id"));
                user.setUserName(rs.getString("vu_user_name"));
                user.setUserPassword(rs.getString("vu_user_password"));
                user.setUserRoleName(rs.getString("vu_user_role_name"));
                user.setUserPhoneNumber(rs.getString("vu_user_phone_number"));
                user.setUserGender(rs.getString("vu_user_gender"));
                user.setUserStatus(rs.getInt("vu_user_status"));
                user.setUserVersion(rs.getString("vu_user_version"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> findPages(int page, int pageSize) {
        List<User> users=new ArrayList<User>();
        Connection con=DBUtil.getConnection();
        String sql="select * from vote_user limit ?,?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, (page-1)*pageSize);
            ps.setInt(2,pageSize);
            ResultSet rs= ps.executeQuery();
            while(rs.next()){
                User user=new User();
                user.setUserId(rs.getInt("vu_user_id"));
                user.setUserName(rs.getString("vu_user_name"));
                user.setUserPassword(rs.getString("vu_user_password"));
                user.setUserRoleName(rs.getString("vu_user_role_name"));
                user.setUserPhoneNumber(rs.getString("vu_user_phone_number"));
                user.setUserGender(rs.getString("vu_user_gender"));
                user.setUserStatus(rs.getInt("vu_user_status"));
                user.setUserVersion(rs.getString("vu_user_version"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public int totalPages(int pageSize) {
        Connection con=DBUtil.getConnection();
        String sql="select count(*) num from vote_user";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                int num=rs.getInt("num");
                if(num%pageSize==0){
                    return num/pageSize;
                }else{
                    return num/pageSize+1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public int getTotalUsersNumber(){//获取vote_user表里所有用户数
        Connection con = DBUtil.getConnection();
        String sql="select count(*) from vote_user";
        try {
            PreparedStatement ps=con.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                int totalUserNumber=rs.getInt(1);
                return totalUserNumber;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public void createVote(Vote vote) {
        Connection con = DBUtil.getConnection();
        String sql = "insert into vote_ticket values(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,vote.getVotesId());
            ps.setString(2,vote.getVotesName());
            ps.setString(3,vote.getStartDate());
            ps.setString(4,vote.getEndDate());
            ps.setString(5,vote.getContentVoteDesc());
            ps.setString(6,vote.getVoteOption1());
            ps.setString(7,vote.getVoteOption2());
            ps.setString(8,vote.getVoteOption3());
            ps.setString(9,vote.getVoteOption4());
            ps.setString(10,"投票中");
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ArrayList<Vote> getVoteInDifferentStatus(String status) {//获取不同状态下的   投票信息 共通方法
        Connection con=DBUtil.getConnection();
        String sql="select * from vote_ticket where vt_status= ? ";
        String vtId,vtName,vtStartTime,vtEndTime,vtContentVoteDesc,vtVoteOption1,vtVoteOption2,vtVoteOption3,
                vtVoteOption4,vtStatus;
        ArrayList<Vote> voteList = new ArrayList<Vote>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,status);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                vtId = rs.getString("vt_id");
                vtName = rs.getString("vt_name");
                vtStartTime = rs.getString("vt_start_time");
                vtEndTime = rs.getString("vt_end_time");
                vtContentVoteDesc = rs.getString("vt_content_vote_desc");
                vtVoteOption1 = rs.getString("vt_vote_option1");
                vtVoteOption2 = rs.getString("vt_vote_option2");
                vtVoteOption3 = rs.getString("vt_vote_option3");
                vtVoteOption4 = rs.getString("vt_vote_option4");
                vtStatus = rs.getString("vt_status");
                Vote vote = new Vote(vtId,vtName,vtStartTime,vtEndTime,vtContentVoteDesc,vtVoteOption1,vtVoteOption2,vtVoteOption3,
                        vtVoteOption4,vtStatus);
                voteList.add(vote);
            }
            return voteList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Vote> getVotingVote() {/*获取所有 投票中 的投票信息*/
        UserDao userDao = new UserDao();
        ArrayList<Vote> votingList = userDao.getVoteInDifferentStatus("投票中");
        return votingList;
    }

    @Override
    public ArrayList<Vote> getAllFinishedVote() {/*获取所有 已结束 的投票信息*/
        UserDao userDao = new UserDao();
        ArrayList<Vote> FinishedVoteList = userDao.getVoteInDifferentStatus("已结束");
        return FinishedVoteList;
    }

    @Override
    public int getVoteNumberInDifferentStatus(String status) {//获取不同状态下的  投票信息数量的共通方法
        int number=0;
        Connection con=DBUtil.getConnection();
        String sql="select count(*) from vote_ticket where vt_status= ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,status);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                number = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return number;
    }

    @Override
    public int getVotingVoteNumber() {/*获取所有投票中的投票   的数量*/
        UserDao userDao = new UserDao();
        int VotingNumber = userDao.getVoteNumberInDifferentStatus("投票中");
        return VotingNumber;
    }

    @Override
    public int getAllFinishedVoteNumber() {/*获取所有已结束的投票   的数量*/
        UserDao userDao = new UserDao();
        int FinishedNumber = userDao.getVoteNumberInDifferentStatus("已结束");
        return FinishedNumber;
    }

    @Override
    public int getDifferentItemsVotedNumber(String itemName) {
        Connection con = DBUtil.getConnection();
        String sql = "select count("+itemName+") from vote_info";
        int someColumnNumber=0;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                someColumnNumber = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return someColumnNumber;
    }

    @Override
    public int getTotalEnterNumber(String itemName) {

        return 0;
    }

    @Override
    public int getAllVotesNumber() {//还没写完
        Connection con = DBUtil.getConnection();
        String sql = "select count(*) from vote_ticket";
        return 0;
    }

    /**
     * 获取所有数据库中创建的投票，用于查看和管理删除。。。
     * @return
     */
    @Override
    public ArrayList<Vote> getAllVoteInfo() {
        ArrayList<Vote> arrayList = new ArrayList<>();
        Connection con = DBUtil.getConnection();
        String sql = "select * from vote_ticket";
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String votesId = rs.getString("vt_id");
                String votesName = rs.getString("vt_name");
                String startDate = rs.getString("vt_start_time");
                String endDate = rs.getString("vt_end_time");
                String contentVoteDesc = rs.getString("vt_content_vote_desc");
                String voteOption1 = rs.getString("vt_vote_option1");
                String voteOption2 = rs.getString("vt_vote_option2");
                String voteOption3 = rs.getString("vt_vote_option3");
                String voteOption4 = rs.getString("vt_vote_option4");
                String status = rs.getString("vt_status");
                Vote vote = new Vote(votesId,votesName,startDate,endDate,contentVoteDesc,
                        voteOption1,voteOption2,voteOption3,voteOption4,status);
                arrayList.add(vote);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arrayList;
    }

    @Override
    public Vote getVoteInfoByID(String votesId) {//通过投票ID查找此投票项目所有信息
        Connection con = DBUtil.getConnection();
        String sql="select * from vote_ticket where vt_id = ?";
        Vote voteByIdInfo = new Vote();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,votesId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String votesName = rs.getString("vt_name");
                String startDate = rs.getString("vt_start_time");
                String endDate = rs.getString("vt_end_time");
                String contentVoteDesc = rs.getString("vt_content_vote_desc");
                String voteOption1 = rs.getString("vt_vote_option1");
                String voteOption2 = rs.getString("vt_vote_option2");
                String voteOption3 = rs.getString("vt_vote_option3");
                String voteOption4 = rs.getString("vt_vote_option4");
                String status = rs.getString("vt_status");
                voteByIdInfo = new Vote(votesId,votesName,startDate,endDate,contentVoteDesc,
                        voteOption1,voteOption2,voteOption3,voteOption4,status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return voteByIdInfo;
    }

    @Override
    public void modifyVoteInfo(Vote vote) {//通过Id修改、更新投票信息
        Connection con = DBUtil.getConnection();
        String sql = "update vote_ticket set vt_name=?,vt_start_time=?,vt_end_time=?,vt_content_vote_desc=?," +
                "vt_vote_option1=?,vt_vote_option2=?,vt_vote_option3=?,vt_vote_option4=?,vt_status=? " +
                "where vt_id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,vote.getVotesName());
            ps.setString(2,vote.getStartDate());
            ps.setString(3,vote.getEndDate());
            ps.setString(4,vote.getContentVoteDesc());
            ps.setString(5,vote.getVoteOption1());
            ps.setString(6,vote.getVoteOption2());
            ps.setString(7,vote.getVoteOption3());
            ps.setString(8,vote.getVoteOption4());
            ps.setString(9,vote.getStatus());
            ps.setString(10,vote.getVotesId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteVoteById(String deleteVoteId) {//通过Id删除投票信息
        Connection con = DBUtil.getConnection();
        String sql = "delete from vote_ticket where vt_id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,deleteVoteId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}