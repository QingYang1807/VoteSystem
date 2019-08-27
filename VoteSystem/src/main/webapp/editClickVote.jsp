<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16414
  Date: 2019/8/25
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>管理中心-管理列表-开心投票吧</title>
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="resource/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="resource/css/votes.css">
    <link rel="stylesheet" href="resource/css/votingListStyle.css">
    <link rel="stylesheet" href="resource/css/uiEditClickStyle.css">
</head>
<body>
<!--导航栏-->
<div class="nav">
    <div class="logo" style="background-image: url('resource/img/Logo.gif')"></div>
    <div class="menu" id="menu"><i class="fa fa-bars" aria-hidden="true"></i></div>
    <div class="right">
        <%--        <div class="notice">提醒</div>--%>
        <div class="userInfo">
            <%--            <span>图标</span>--%>
            <span>${LoginUserInfo.userRoleName}</span>
            <%--            <span>头像</span>--%>
        </div>
        <div class="exitLogin" id="exitLogin"><i class="fa fa-sign-out" aria-hidden="true"></i>退出登录</div>
    </div>
</div>
<!--主体-->
<div class="main">
    <div class="row">
        <div class="col-md-2 manageList" id="manageList">
            <ul>
                <li class="liTitle">管理列表</li>
                <li class="liItem" id="managerMain">管理首页</li>
                <li class="liItem" id="createVote">创建投票</li>
                <li class="liItem">管理投票</li>
                <li class="liItem">账号管理</li>
            </ul>
        </div>

        <div class="content col-md-9" id="content">
            <div id="allContent">
                <div class="content-page-title">管理首页</div>
                <ol>
                    <li>
                        <i class="fa fa-home homeIcon"></i>
                        <a href="votes.jsp">管理首页</a>
                        <i class="fa fa-angle-double-right nextSign" aria-hidden="true"></i>
                        <a href="">投票列表</a>
                    </li>
                </ol>

                <div class="backFrame">
                    <div class="voteListTitle">修改投票信息</div>

                    <div class="tableList">
                        <form action="updateVoteData" method="post">
                            <span class="text-gradient" id="edit_error_notice"></span>
                            <div class="votes_id">
                                <span>投票ID：</span>
                                <span type="text">${currentActiveVoteId}</span>
                                <input type="text" value="${clickVotesInfo.votesId}" name="votes_id" style="display: none">
                            </div><br><!--投票ID+当前时间字符串串-->
                            <div class="votes_name">
                                <span>投票名称</span>
                                <input type="text" id="votesName" name="votes_name" value="${clickVotesInfo.votesName}">
                            </div><br>
                            <div class="start_date">
                                <span>开始时间</span>
                                <input type="date" id="startDate" name="start_date" value="${clickVotesInfo.startDate}"></div><br>
                            <div class="end_date">
                                <span>结束时间</span>
                                <input type="date" id="endDate" name="end_date" value="${clickVotesInfo.endDate}"></div><br>

                            <div class="vote_select" voteSelect>
                                <span>内容项投票描述:</span>
                                <input type="text" id="contentVoteDesc" name="content_vote_desc" value="${clickVotesInfo.contentVoteDesc}"><br>
                                <span>选项内容：</span><br>
                                <span id="span_input_1">选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项：<input type="text" id="vote_Option_1" name="vote_Option_1" value="${clickVotesInfo.voteOption1}"></span><br>
                                <span id="span_input_2">选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项：<input type="text" id="vote_Option_2" name="vote_Option_2" value="${clickVotesInfo.voteOption2}"></span><br>
                                <span id="span_input_3">选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项：<input type="text" id="vote_Option_3" name="vote_Option_3" value="${clickVotesInfo.voteOption3}"></span><br>
                                <span id="span_input_4">选&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;项：<input type="text" id="vote_Option_4" name="vote_Option_4" value="${clickVotesInfo.voteOption4}"></span><br>
                            </div>
                            <div class="vote_status">
                                <span>投票状态：</span>
                                <select name="vote_status" id="vote_status">
                                    <option value="投票中">投票中</option>
                                    <option value="已结束">已结束</option>
                                </select>
                            </div>

                            <input id="tagIndex" value="3" style="display: none"></span>
                            
                            <div class="btn_frame">
                                <i class="fa fa-pencil btn_submit_edit_icon" aria-hidden="true"></i>
                                <input type="button" id="btn_submit_edit" class="btn_submit_edit" value="&nbsp;&nbsp;提交修改" onclick="isNull()">
                                <div class="btn2_filtrate">
                                    <a href="votingList.jsp"><i class="fa fa-undo" aria-hidden="true"></i>取消</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
<script>
    function isNull(){
        var votesName = document.getElementById("votesName");
        var startDate = document.getElementById("startDate");
        var endDate = document.getElementById("endDate");
        var contentVoteDesc = document.getElementById("contentVoteDesc");
        var vote_Option_1 = document.getElementById("vote_Option_1");
        var vote_Option_2 = document.getElementById("vote_Option_2");
        var vote_Option_3 = document.getElementById("vote_Option_3");
        var vote_Option_4 = document.getElementById("vote_Option_4");

        var editErrorNotice = $("#edit_error_notice");
        var sign=0;

        editErrorNotice.empty();
        if(votesName.value==""||votesName.value.length==0){
            editErrorNotice.append("投票名称为空！");
            sign++;
        }
        if(startDate.value==""||startDate.value.length==0){
            editErrorNotice.append("开始日期为空！");
            sign++;
        }
        if(endDate.value==""||endDate.value.length==0){
            editErrorNotice.append("截止日期为空！");
            sign++;
        }
        if(contentVoteDesc.value==""||contentVoteDesc.value.length==0){
            editErrorNotice.append("内容项投票描述为空！");
            sign++;
        }
        if(vote_Option_1.value==""||vote_Option_1.value.length==0){
            editErrorNotice.append("选项1 内容为空！");
            sign++;
        }
        if(vote_Option_2.value==""||vote_Option_2.value.length==0){
            editErrorNotice.append("选项2 内容为空！");
            sign++;
        }
        if(vote_Option_3.value==""||vote_Option_3.value.length==0){
            editErrorNotice.append("选项3 内容为空！");
            sign++;
        }
        if(vote_Option_4.value==""||vote_Option_4.value.length==0){
            editErrorNotice.append("选项4 内容为空！");
            sign++;
        }

        if(sign==0){
            $("#btn_submit_edit").prop("type","submit");
        }else{
            alert("您还有未填选项！")
        }
    }
</script>
<script>
    $("#createVote").click(function () {
        window.location.href = "createVotes.jsp";
    });
    $("#exitLogin").click(function () {
        window.location.href = "exitServlet";
    });
    $("#managerMain").click(function () {
        window.location.href = "votes.jsp";
    });
    $("#logo").click(function () {
        window.location.href = "votes.jsp";
    });
    $("#menu").click(function () {
        var displayVal = $("#manageList").css("display");
        if (displayVal == "block") {
            $("#manageList").css("display", "none");
            $("#content").attr("class", "content col-md-12");
        } else if (($("#manageList").css("display")) == "none") {
            $("#manageList").css("display", "block");
            $("#content").attr("class", "content col-md-9");
        }

    });
</script>

</body>
</html>
