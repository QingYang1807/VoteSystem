<%@ page import="com.lf.dao.UserDao" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 16414
  Date: 2019/8/22
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.util.Date" %>
<%
    Integer hitsCount = (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
        /* 第一次访问 */
        hitsCount = 1;
    }else{
        /* 返回访问值 */
        hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
    UserDao userDao = new UserDao();
    int visitedNumber = userDao.setAccessStatistics(hitsCount);
    request.getSession().setAttribute("visitedNumber",visitedNumber);
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <title>管理中心-创建投票-开心投票吧</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="resource/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="resource/css/votes.css">
    <link rel="stylesheet" href="resource/css/votingListStyle.css">
    <link rel="stylesheet" href="resource/css/uiEditClickStyle.css">
    <link rel="stylesheet" href="resource/css/uiCreateVotes.css">
</head>
<body onload="a_link()">

<!--导航栏-->
<div class="nav">
    <div class="logo" style="background-image: url('resource/img/Logo.gif')"></div>
    <div class="menu" id="menu"><i class="fa fa-bars" aria-hidden="true"></i></div>
    <div class="right">
        <%--        <div class="notice">提醒</div>--%>
        <div class="userInfo" id="userInfo">
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
                <li class="liItem" id="createVoteNav">创建投票</li>
                <li class="liItem" id="managerVotes">管理投票</li>
                <li class="liItem" id="accounterManager">账号管理</li>
            </ul>
        </div>

        <div class="content col-md-9" id="content">
            <div id="allContent">
                <div class="content-page-title">管理首页</div>
                <ol>
                    <li>
                        <i class="fa fa-home homeIcon"></i>
                        <a href="getAllVoteInfo">管理首页</a>
                        <i class="fa fa-angle-double-right nextSign" aria-hidden="true"></i>
                        <a id="create_vote_link">创建投票</a>
                    </li>
                </ol>

                <div class="backFrame">
                    <div class="voteListTitle">创建投票</div>

                    <div class="input_area">
                        <form action="createVote" method="get">
                            <span class="text-gradient" id="create_error_notice"></span>
                            <div class="votes_id">
                                <%
                                    Date date = new Date();
                                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
                                    String voteId = "TP" + dateFormat.format(date);
                                %>
                                <%--                <%=voteId%>--%>
                                <span>投票ID：</span>
                                <input type="text" value="<%=voteId%>" readonly disabled>
                                <input type="text" value="<%=voteId%>" name="votes_id" style="display: none">
                            </div>
                            <br><!--投票ID+当前时间字符串串-->
                            <div class="votes_name">
                                <span>投票名称</span>
                                <input type="text" id="votesName" name="votes_name"></div>
                            <br>
                            <div class="start_date"><span>开始时间</span>
                                <input type="date" id="startDate" name="start_date"></div>
                            <br>
                            <div class="end_date"><span>结束时间</span>
                                <input type="date" id="endDate" name="end_date">
                            </div>
                            <br>

                            <div class="vote_select" id="voteSelect">
                                <span>内容项投票描述:</span>
                                <input type="text" id="contentVoteDesc" name="content_vote_desc"><br>
                                <span>选项内容：</span><br>
                                <span id="span_input_1">选项1：<input type="text" id="vote_Option_1"
                                                                 name="vote_Option_1"></span><br>
                                <span id="span_input_2">选项2：<input type="text" id="vote_Option_2"
                                                                 name="vote_Option_2"></span><br>
                                <span id="span_input_3">选项3：<input type="text" id="vote_Option_3"
                                                                 name="vote_Option_3"></span><br>
                                <span id="span_input_4">选项4：<input type="text" id="vote_Option_4"
                                                                 name="vote_Option_4"></span><br>
                            </div>
                            <input id="tagIndex" value="3" style="display: none"></span>

                            <div class="btn_frame">
<%--                                <button id="createOption" class="create_option">增一项</button>--%>
<%--                                <button id="subtractOption" class="subtract_option">减一项</button>--%>
                                <i class="fa fa-plus btn_submit_edit_icon" aria-hidden="true"></i>
                                <input type="button" id="btn_create_vote" class="btn_submit_edit"
                                       value="&nbsp;&nbsp;创建投票" onclick="isNull()">
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

        var createErrorNotice = $("#create_error_notice");
        var sign=0;

        createErrorNotice.empty();
        if(votesName.value==""||votesName.value.length==0){
            createErrorNotice.append("投票名称为空！");
            sign++;
        }
        if(startDate.value==""||startDate.value.length==0){
            createErrorNotice.append("开始日期为空！");
            sign++;
        }
        if(endDate.value==""||endDate.value.length==0){
            createErrorNotice.append("截止日期为空！");
            sign++;
        }
        if(contentVoteDesc.value==""||contentVoteDesc.value.length==0){
            createErrorNotice.append("内容项投票描述为空！");
            sign++;
        }
        if(vote_Option_1.value==""||vote_Option_1.value.length==0){
            createErrorNotice.append("选项1 内容为空！");
            sign++;
        }
        if(vote_Option_2.value==""||vote_Option_2.value.length==0){
            createErrorNotice.append("选项2 内容为空！");
            sign++;
        }
        if(vote_Option_3.value==""||vote_Option_3.value.length==0){
            createErrorNotice.append("选项3 内容为空！");
            sign++;
        }
        if(vote_Option_4.value==""||vote_Option_4.value.length==0){
            createErrorNotice.append("选项4 内容为空！");
            sign++;
        }

        if(sign==0){
            $("#btn_create_vote").prop("type","submit");
        }else{
            alert("您还有未填选项！")
        }
    }
</script>
<script>
    $("#exitLogin").click(function () {
        window.location.href = "exitServlet";
    });
    $("#managerMain").click(function () {
        window.location.href = "getAllVoteInfo";
    });
    $("#logo").click(function () {
        window.location.href = "getAllVoteInfo";
    });
    $("#managerVotes").click(function () {
        window.location.href = "votingList.jsp";
    });
    $("#accounterManager").click(function () {
        window.location.href = "getCurrentLoginUserInfo";
    });
    $("#userInfo").click(function () {
        window.location.href = "getCurrentLoginUserInfo";
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
<script>
    function a_link(){
        var a = location.href.split('/');
        $("#create_vote_link").attr('href',a[a.length-1]);
        if(a[a.length-1]=="createVotes.jsp"){
            $("#createVoteNav").css("background-color","#f2f6f9");
        }
    }
</script>
</body>
</html>
