<%--
  Created by IntelliJ IDEA.
  User: 16414
  Date: 2019/8/21
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>投票编辑-投票管理-开心投票吧</title>
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="resource/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="resource/css/votes.css">

</head>
<body onload="a_link()">
<!--导航栏-->
<div class="nav">
    <div class="logo" id="logo" style="background-image: url('resource/img/Logo.gif');cursor: pointer;"></div>
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
                <li class="liItem" id="createVoteNav">创建投票</li>
                <li class="liItem" id="managerVote">管理投票</li>
                <li class="liItem">账号管理</li>
            </ul>
        </div>

        <div class="content col-md-9" id="content">
            <div id="allContent">
                <div class="content-page-title">管理首页</div>
                <ol>
                    <li><i class="fa fa-home homeIcon"></i><a id="managerHomePage">管理首页</a></li>
                </ol>
                <div class="rowCard">
                    <div class="card">
                        <div class="details">
                            <div class="number"> ${votingNumber} </div>
                            <div class="desc"> 进行中的投票 </div>
                        </div>
                        <a class="more" href="votingList.jsp">查看明细<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i></a>
                    </div>
                    <div class="card">
                        <div class="details">
                            <div class="number"> ${finishedNumber} </div>
                            <div class="desc"> 已结束的投票 </div>
                        </div>
                        <a class="more" href="votingList.jsp">查看明细<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i></a>
                    </div>
                    <div class="card">
                        <div class="details">
                            <div class="number"> 1 </div>
                            <div class="desc"> 总投票数量 </div>
                        </div>
                        <a class="more" href="votingList.jsp">查看明细<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i></a>
                    </div>
                    <div class="card">
                        <div class="details">
                            <div class="number"> 1 </div>
                            <div class="desc"> 总访问量 </div>
                        </div>
                        <a class="more" href="votingList.jsp">查看明细<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i></a>
                    </div>
                    <div class="card">
                        <div class="details">
                            <div class="number"> ${finishedNumber} </div>
                            <div class="desc"> 已完成的投票 </div>
                        </div>
                        <a class="more" href="votingList.jsp">查看明细<i class="fa fa-arrow-circle-o-right" aria-hidden="true"></i></a>
                    </div>
                </div>
                <div class="rowAnnouncement">
                    <div class="PlatformAnnouncement"></div><!--平台公告-->
                    <hr>
                    <table class="tableStyle"></table>
                </div>
            </div>

        </div>
    </div>
</div>
<script>
    $("#createVoteNav").click(function(){
        window.location.href ="createVotes.jsp";
    });
    $("#exitLogin").click(function () {
        window.location.href = "exitServlet";
    });
    $("#managerVote").click(function () {
        window.location.href = "votingList.jsp";
    });
    $("#logo").click(function () {
        window.location.href = "votes.jsp";
    });
    $("#menu").click(function () {
        var displayVal = $("#manageList").css("display");
        if(displayVal=="block"){
            $("#manageList").css("display","none");
            $("#content").attr("class","content col-md-12");
        }
        else if(($("#manageList").css("display"))=="none"){
            $("#manageList").css("display","block");
            $("#content").attr("class","content col-md-9");
        }

    });
</script>
<script>
    function a_link(){
        var a = location.href.split('/');
        $("#managerHomePage").attr('href',a[a.length-1]);
        if(a[a.length-1]=="votes.jsp"){
            $("#managerMain").css("background-color","#f2f6f9");
        }
    }
</script>
</body>
</html>
