<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 16414
  Date: 2019/8/5
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="java.io.*,java.util.*" %>
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
%>
<html>
<head>
    <title>Register Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
    <script src="resource/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="resource/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resource/css/uiGeneral.css">
    <link rel="stylesheet" href="resource/css/uiLoginStyle.css">

</head>
<body>
<!--标题栏-->
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
<!--以上为标题栏-->
<div class="tpb_max">
    <div class="tpb_logo_text">
        开心<span>投票吧</span>

        <span class="fa-stack fa-lg">
            <i class="fa fa-square-o fa-stack-2x"></i>
            <i class="fa fa-align-left fa-rotate-270 fa-stack-1x"></i><!--fa-spin 旋转-->
        </span>
    </div>

    <div class="tpb_login_font">
        <span>用户注册</span>
    </div>

    <div class="tpb_login_input">
        <div class="loginFrame">
            <span class="text-gradient" id="regist_error_notice"></span>
            <div class="registItem">
                <form action="addUser" method="post">
                    <input type="text" name="user_name" id="user_name" placeholder="用户名"/><br>
                    <input type="text" name="user_password" id="user_password" placeholder="密码"/><br>
                    <span>性别:</span>
                    <input type="radio" name="user_gender" value="man" checked id="gender_man"/><span>男</span>
                    <input type="radio" name="user_gender" value="woman" id="gender_woman"/><span>女</span><br>
                    <input type="text" name="user_role_name" id="user_role_name" placeholder="昵称"/><br>
                    <input type="text" name="user_phone_number" id="user_phone_number" placeholder="电话号码"/><br>
                    <span>用户身份: </span>
                    <select name="user_version" id="select_user_type">
                        <option value="0">网站管理员</option>
                        <option value="1">投票发起人员</option>
                        <option value="2">投票人员</option>
                    </select><br>
                    <input type="button" value="提交按钮" id="regist_btn" class="submit_btn" onclick="isNull()"/>
                </form>
            </div>
        </div>
    </div>


</div>
<script>
    function isNull(){
        var userName = document.getElementById("user_name");
        var userPassword = document.getElementById("user_password");
        var userRoleName = document.getElementById("user_role_name");
        var userPhoneNumber = document.getElementById("user_phone_number");
        var registErrorNotice = $("#regist_error_notice");
        var sign=0;

        registErrorNotice.empty();
        if(userName.value==""||userName.value.length==0){
            registErrorNotice.append("用户名为空！");
            sign++;
        }
        if(userPassword.value==""||userPassword.value.length==0){
            registErrorNotice.append("密码为空！");
            sign++;
        }
        if(userRoleName.value==""||userRoleName.value.length==0){
            registErrorNotice.append("昵称为空！");
            sign++;
        }
        if(userPhoneNumber.value==""||userPhoneNumber.value.length==0){
            registErrorNotice.append("电话号码为空！");
            sign++;
        }

        if(sign==0){
            $("#regist_btn").prop("type","submit");
        }else{
            alert("您还有未填选项！")
        }
    }
</script>
<script>
    var a = location.href.split('/');
    if(a[a.length-1]=="register.jsp"){
        var bol=a[a.length-1]=="register.jsp";//true
        var navBarDivObj = $("#div_nav_regist");
        // background: #080808;
        // color: #FFFFFF;
        navBarDivObj.css({"background":"#080808","color":"#FFFFFF"});
    }
</script>
</body>
</html>
