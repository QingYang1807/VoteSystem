<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16414
  Date: 2019/8/5
  Time: 23:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<html>
<head>
    <title>Login Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
    <script src="resource/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="resource/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resource/css/uiGeneral.css">
    <link rel="stylesheet" href="resource/css/uiLoginStyle.css">
</head>
<body>
<%if(session.getAttribute("LoginUserInfo")!=null){response.sendRedirect(request.getContextPath()+"/votes.jsp");}%>

<jsp:include page="nav.html" flush="true"/>

<div class="tpb_max">
    <div class="tpb_logo_text">
        开心评选<span>投票吧</span>

        <span class="fa-stack fa-lg">
            <i class="fa fa-square-o fa-stack-2x"></i>
            <i class="fa fa-align-left fa-rotate-270 fa-stack-1x"></i><!--fa-spin 旋转-->
        </span>
        
<%--        <div class="vote_Logo">--%>
<%--            <span class="span_logo1">I</span>--%>
<%--            <span class="span_logo2">I</span>--%>
<%--            <span class="span_logo3">I</span>--%>
<%--        </div>--%>

    </div>
    <div class="tpb_login_font">
        <span>用户登录</span>
    </div>
    <div class="tpb_login_input">
        <span id="LoginState"></span>
        <div class="loginFrame">
            <span class="text-gradient" id="login_error_notice">
                ${login_error_notice}
            </span>

            <div class="loginItem">
                <form action="loginServlet" method="post"><!--loginServlet-->
                    <input type="text" id="user_name" name="user_name" class="login_input1" placeholder="用户名/手机号码" value=""><br>
                    <input type="text" id="user_password" name="user_password" class="login_input2" placeholder="请输入密码" value=""><br>
<%--                    <input type="checkbox" name="loginStatus" class="login_input3">记住登录状态<br>--%>
                    <input type="button" value="登&nbsp;&nbsp;录" id="login_btn" class="submit_btn" onclick="isNull()">
                </form>
                <div><a href="register.jsp" class="noAccountToRegiNote">没有账号？立即注册</a></div>
            </div>
        </div>
    </div>

</div>
<script>
    function isNull(){
        var userName = document.getElementById("user_name");
        var userPassword = document.getElementById("user_password");
        var loginErrorNotice = $("#login_error_notice");
        var sign=0;

        loginErrorNotice.empty();
        if(userName.value==""||userName.value.length==0){
            loginErrorNotice.append("用户名为空！");
            sign++;
        }
        if(userPassword.value==""||userPassword.value.length==0){
            loginErrorNotice.append("密码为空！");
            sign++;
        }

        if(sign==0){
            $("#login_btn").prop("type","submit");
        }else{
            alert("您还有未填选项！")
        }
    }
</script>
<script>
    var a = location.href.split('/');
    // document.body.append(a[a.length-1]);
    if(a[a.length-1]=="login.jsp"){
        var bol=a[a.length-1]=="login.jsp";//true
        var navBarDivObj = $("#div_nav_login");
        // background: #080808;
        // color: #FFFFFF;
        navBarDivObj.css({"background":"#080808","color":"#FFFFFF"});
    }
</script>
</body>
</html>
