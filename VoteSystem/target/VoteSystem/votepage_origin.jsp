<%--
  Created by IntelliJ IDEA.
  User: 16414
  Date: 2019/8/5
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false"%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
    <title>Vote Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
    <script src="resource/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="resource/css/uiGeneral.css">
    <link rel="stylesheet" href="resource/css/uiVotePageStyle.css">
</head>
<%--<script type="text/javascript">--%>
<%--    function getData() {--%>
<%--        window.location.href = "judgeHasNotSession";}/*onload="getData()"*/--%>
<%--</script>--%>
<body>
<%if(session.getAttribute("LoginUserInfo")==null)response.sendRedirect(request.getContextPath()+"/login.jsp");%>
<div class="TheNavigationBar">
    <div class="TheNavigationBar">
        <div class="navBarDivWebName"><a href="index.jsp" class="webNameTitle">投票系统</a></div>
        <div class="navBarDiv" id="div_nav_main"><a href="index.jsp" class="">主页</a></div>
        <div class="navBarDiv" id="div_nav_regist"><a href="register.jsp" class="">注册页面</a></div>
        <div class="navBarDiv" id="div_nav_login"><a href="login.jsp" class="">登录页面</a></div>
        <div class="navBarDiv" id="div_nav_vote"><a href="votepage_origin.jsp" class="">投票页面</a></div>
        <div class="LoginRegistNav">
            <div class="loginStyle navBarDiv"><a href="userCenter.jsp">欢迎您,${LoginUserInfo.userRoleName}</a></div>
            <div class="quitStyle navBarDiv"><a href="exitServlet">退出登录</a></div>
        </div>
    </div>

</div>

<span id="LoginState"></span>
<form action="" method="post">
    <!--投票页面-->
    投票界面
    <%=request.getContextPath()%>
</form>
</body>
<script>
    var a = location.href.split('/');
    if(a[a.length-1]=="votepage_origin.jsp"){
        var bol=a[a.length-1]=="votepage_origin.jsp";//true
        var navBarDivObj = $("#div_nav_vote");
        // background: #080808;
        // color: #FFFFFF;
        navBarDivObj.css({"background":"#080808","color":"#FFFFFF"});
    }
</script>
</html>
