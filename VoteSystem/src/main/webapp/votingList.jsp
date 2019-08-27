<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16414
  Date: 2019/8/25
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>管理中心-管理列表-开心投票吧</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="resource/css/bootstrap.min.css">
    <link rel="stylesheet" href="resource/font-awesome-4.7.0/css/font-awesome.min.css">
    <script src="resource/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="resource/css/votes.css">
    <link rel="stylesheet" href="resource/css/votingListStyle.css">
</head>
<body onload="a_link()">
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
                <li class="liItem" id="createVoteNav">创建投票</li>
                <li class="liItem" id="managerVotes">管理投票</li>
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
                        <a id="lookVoteLink">投票列表</a>
                    </li>
                </ol>

                <div class="backFrame">
                    <div class="voteListTitle">投票列表</div>
                    <div class="btn1_createVote">
                        <a href="createVotes.jsp"> <i class="fa fa-plus" aria-hidden="true"></i>创建投票</a>
                    </div>
                    <div class="btn2_filtrate">
                        <a href=""><i class="fa fa-crosshairs" aria-hidden="true"></i>筛选</a>
                    </div>
                    <div class="tableList">
                        <table>
                            <tr>
                                <td>编号</td>
                                <td>标题</td>
                                <td>投票量</td>
                                <td>状态</td>
                                <td>时间</td>
                                <td>操作</td>
                            </tr>
                            <%int i=1;%>
                            <c:forEach items="${arrayList}" var="al">
                                <tr>
                                    <td id="votesID_<%=i%>"><c:out value="${al.votesId}"></c:out></td>
                                    <td><c:out value="${al.votesName}"></c:out></td>
                                    <td><c:out value="${al.contentVoteDesc}"></c:out></td>
                                    <td><c:out value="${al.status}"></c:out></td>
                                    <td>
                                        开始时间:<c:out value="${al.startDate}"></c:out> <br>
                                        结束时间:<c:out value="${al.endDate}"></c:out>
                                    </td>
                                    <td>
                                        <span class="btn btn1" id="btn_edit_<%=i%>" onclick="editClick(this)">编辑</span>
                                        <span class="btn btn2" id="btn_delete_<%=i%>" onclick="deleteClick(this)">删除</span>
                                        <span class="btn btn3" id="btn_look_<%=i%>" onclick="lookClick(this)">查看</span>
                                    </td>
                                </tr>
                                <%i++;%>
                            </c:forEach>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function getVotesId(object){
        var currentVotesId = $(object).attr("id");
        // alert(currentVotesId);
        currentVotesId = currentVotesId.split("_",3);
        var idNumber = currentVotesId[2];//点击按钮所在的ID的数字，用于获取投票信息ID
        var votesID = "votesID_" + idNumber;
        var votesIDValue = $("#"+votesID).html();//TP20190823110652
        return votesIDValue;
    }
    function editClick(object){
        var currentVotesId = $(object).attr("id");
        // alert(currentVotesId);
        currentVotesId = currentVotesId.split("_",3);
        var idNumber = currentVotesId[2];//点击按钮所在的ID的数字，用于获取投票信息ID
        var votesID = "votesID_" + idNumber;
        var votesIDValue = $("#"+votesID).html();//TP20190823110652
        alert("您正在编辑的是ID为："+votesIDValue+"的投票项目");
        location.href="<%=basePath%>getClickInfo?currentClickVotesId="+votesIDValue;
        <%--location.href="<%=basePath%>getClickInfo?currentClickVotesId='TP20190823110652'";--%>
    }
    function deleteClick(object){
        var votesIDValue = getVotesId(object);
        alert("您正在删除的是ID为："+votesIDValue+"的投票项目");
        location.href="<%=basePath%>deleteVoteById?currentClickVotesId="+votesIDValue;
    }
    function lookClick(object){
        var currentVotesId = $(object).attr("id");
        alert(currentVotesId);
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
        window.location.href = "votes.jsp";
    });
    $("#logo").click(function () {
        window.location.href = "votes.jsp";
    });
    $("#managerVotes").click(function () {
        window.location.href = "votingList.jsp";
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
        $("#lookVoteLink").attr('href',a[a.length-1]);
        if(a[a.length-1]=="votingList.jsp"){
            $("#managerVotes").css("background-color","#f2f6f9");
        }
    }
</script>
</body>
</html>
