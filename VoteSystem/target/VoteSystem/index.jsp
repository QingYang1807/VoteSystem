<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false" %>
<html>
    <head>
        <title>投票页面</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
        <script src="resource/js/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="resource/css/uiGeneral.css">
        <link rel="stylesheet" href="resource/css/uiVotePageStyle.css">

    </head>
    <script>
        function goOn(){
            window.location.href ="login.jsp";
        }
    </script>
<body onload="goOn()">
    <div class="TheNavigationBar">
        <div class="navBarDivWebName"><a href="index.jsp" class="webNameTitle">投票系统</a></div>
        <div class="navBarDiv" id="div_nav_main"><a href="index.jsp" class="">主页</a></div>
        <div class="navBarDiv" id="div_nav_regist"><a href="register.jsp" class="">注册页面</a></div>
        <div class="navBarDiv" id="div_nav_login"><a href="login.jsp" class="">登录页面</a></div>
        <div class="navBarDiv" id="div_nav_vote"><a href="votepage_origin.jsp" class="">投票页面</a></div>
    <div class="LoginRegistNav">
        <%
            if (request.getSession().getAttribute("LoginUserInfo")!=null) {%>
                <div class="loginStyle navBarDiv"><a href="userCenter.jsp">欢迎您,${ sessionScope.LoginUserInfo.userRoleName}</a></div>
                <div class="quitStyle navBarDiv"><a href="exitServlet">退出登录</a></div>
        <% }else{%>
        <div class="navBarDiv"><a href="register.jsp" class="">注册</a></div>
        <div class="navBarDiv"><a href="login.jsp" class="">登录</a></div>
        <%}%>
    </div>
    </div>
    <span id="LoginState"></span>
    <form action="" method="post">

    </form>
    <h2>首页</h2>
    <h2>已经发起的投票</h2>
    <h2>已经结束的投票</h2>
    <h2>参与人数最多的投票</h2>
</body>
<script>
    var a = location.href.split('/');
    if(a[a.length-1]=="index.jsp"){
        var bol=a[a.length-1]=="index.jsp";//true
        var navBarDivObj = $("#div_nav_main");
        // background: #080808;
        // color: #FFFFFF;
        navBarDivObj.css({"background":"#080808","color":"#FFFFFF"});
    }
</script>
</html>
