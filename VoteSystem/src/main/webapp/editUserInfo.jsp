<%@ page import="com.lf.dao.UserDao" %>
<%--
  Created by IntelliJ IDEA.
  User: 16414
  Date: 2019/8/22
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
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
<html>
<head>
    <title>管理中心-账号管理-开心投票吧</title>
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
                        <a id="create_vote_link">账号管理</a>
                    </li>
                </ol>

                <div class="backFrame">
                    <div class="voteListTitle">账号管理</div>

                    <div class="input_area">
                        <form action="modifyUserInfo" method="get">
                            <span class="text-gradient" id="mofidifyErrorNotice">${mofidifyErrorNotice}</span>
                            <div class="votes_id">
                                <span>用户ID：</span>
                                <input type="text" id="votesId" value="${LoginUserInfo.userId}" name="votes_id" readonly disabled>
                            </div>
                            <br>
                            <div class="votes_name">
                                <span>用户名：</span>
                                <input type="text" id="userName" name="user_name" value="${LoginUserInfo.userName}"></div>
                            <br>
                            <div class="start_date"><span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span>
                                <input type="text" id="userPassword" name="user_password" value="${LoginUserInfo.userPassword}"></div>
                            <br>
                            <div class="end_date"><span>用户昵称：</span>
                                <input type="text" id="userRoleName" name="user_role_name" value="${LoginUserInfo.userRoleName}">
                            </div>
                            <div class="end_date"><span>用户电话：</span>
                                <input type="text" id="userPhoneNumber" name="user_phone_number" value="${LoginUserInfo.userPhoneNumber}">
                            </div>
                            <span id="hidden_gender" style="display: none;">${LoginUserInfo.userGender}</span>
                            <span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
                            <select id="userGender" name="user_gender">
                                <option id="userGenderMan" value="man">男</option>
                                <option id="userGenderWoman" value="woman">女</option>
                            </select><br>
                            <span id="hidden_user_version" style="display: none;">${LoginUserInfo.userVersion}</span>
                            <span>用户类型：</span>
                            <select id="userVersion" name="user_version">
                                <option id="webSiteManager" value="0">网站管理员</option>
                                <option id="voterStart" value="1">投票发起人员</option>
                                <option id="voter" value="2">投票人员</option>
                            </select>
                            <div class="btn_frame">
<%--                                <button id="createOption" class="create_option">增一项</button>--%>
<%--                                <button id="subtractOption" class="subtract_option">减一项</button>--%>
                                <i class="fa fa-plus btn_submit_edit_icon" aria-hidden="true"></i>
                                <input type="button" id="btn_confirm_modify" class="btn_submit_edit"
                                       value="&nbsp;&nbsp;确定修改" onclick="isNull()">
                                <div class="btn2_filtrate">
                                    <a href="votes.jsp"><i class="fa fa-undo" aria-hidden="true"></i>取消</a>
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
    var userGender = $("#hidden_gender").text();
    document.getElementsByName("user_gender")[0].value=userGender;

    var userVersion = $("#hidden_user_version").text();
    if(userVersion==0){
        document.getElementsByName("user_version")[0].value=0;
    }else if(userVersion==1){
        document.getElementsByName("user_version")[0].value=1;
    }else if(userVersion==2){
        document.getElementsByName("user_version")[0].value=2;
    }
</script>
<script>
    function isNull(){
        var userName = document.getElementById("userName");
        var userPassword = document.getElementById("userPassword");
        var userRoleName = document.getElementById("userRoleName");
        var userPhoneNumber = document.getElementById("userPhoneNumber");
        var user_gender = document.getElementById("userGender");
        var user_version = document.getElementById("userVersion");

        var mofidifyErrorNotice = $("#mofidifyErrorNotice");
        var sign=0;

        mofidifyErrorNotice.empty();
        if(userName.value==""||userName.value.length==0){
            mofidifyErrorNotice.append("用户名为空！");
            sign++;
        }
        if(userPassword.value==""||userPassword.value.length==0){
            mofidifyErrorNotice.append("密码为空！");
            sign++;
        }
        if(userRoleName.value==""||userRoleName.value.length==0){
            mofidifyErrorNotice.append("用户昵称为空！");
            sign++;
        }
        if(userPhoneNumber.value==""||userPhoneNumber.value.length==0){
            mofidifyErrorNotice.append("用户电话为空！");
            sign++;
        }
        if(user_gender.value==""||user_gender.value.length==0){
            mofidifyErrorNotice.append("性别为空！");
            sign++;
        }
        if(user_version.value==""||user_version.value.length==0){
            mofidifyErrorNotice.append("用户类型为空！");
            sign++;
        }

        if(sign==0){
            $("#btn_confirm_modify").prop("type","submit");
        }else{
            alert("您还有未填选项！")
        }
    }
</script>
<script>
    $("#createVoteNav").click(function () {
        window.location.href = "createVotes.jsp";
    });
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
        if(a[a.length-1]=="editUserInfo.jsp"){
            $("#accounterManager").css("background-color","#f2f6f9");
        }
    }
</script>
</body>
</html>
