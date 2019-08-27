<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 16414
  Date: 2019/8/22
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>创建新投票</title>
    <script src="resource/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="resource/css/uiCreateVotes.css">
</head>
<body>
    <div>
        <form action="createVote" method="get">
            <span class="text-gradient" id="create_error_notice"></span>
            <div class="votes_id">
                <%Date date = new Date();
                SimpleDateFormat dateFormat= new SimpleDateFormat("yyyyMMddhhmmss");
                String voteId = "TP"+dateFormat.format(date);%>
<%--                <%=voteId%>--%>
                <span>投票ID：</span>
                <input type="text" value="<%=voteId%>" readonly disabled>
                <input type="text" value="<%=voteId%>" name="votes_id" style="display: none">
            </div><br><!--投票ID+当前时间字符串串-->
            <div class="votes_name"><span>投票名称</span><input type="text" id="votesName" name="votes_name"></div><br>
            <div class="start_date"><span>开始时间</span><input type="date" id="startDate" name="start_date"></div><br>
            <div class="end_date"><span>结束时间</span><input type="date" id="endDate" name="end_date"></div><br>

            <div class="vote_select" id="voteSelect">
                <span>内容项投票描述:</span>
                <input type="text" id="contentVoteDesc" name="content_vote_desc"><br>
                <span>选项内容：</span><br>
                <span id="span_input_1">选项<input type="text" id="vote_Option_1" name="vote_Option_1"></span><br>
                <span id="span_input_2">选项<input type="text" id="vote_Option_2" name="vote_Option_2"></span><br>
                <span id="span_input_3">选项<input type="text" id="vote_Option_3" name="vote_Option_3"></span><br>
                <span id="span_input_4">选项<input type="text" id="vote_Option_4" name="vote_Option_4"></span><br>
            </div>
            <input id="tagIndex" value="3" style="display: none"></span>

            <button id="createOption" class="create_option">增一项</button>
            <button id="subtractOption" class="subtract_option">减一项</button><br><br>

            <input type="button" id="build" class="build" value="创建" onclick="isNull()">
            <button id="return" class="return">返回</button>
        </form>
    </div>
</body>
<script>
    $("#createOption").click(function () {
        var index=document.getElementById("tagIndex").getAttribute("value");

        //获取新增前span标签中id值的序号
        var a=document.getElementById("voteSelect").childNodes.length;
        var initialLastSpan = document.getElementById("voteSelect").childNodes.item(a-index);//a-2
        var initialLastSpanID = initialLastSpan.getAttribute("id");
        var initialLastSpanIDInNumber = initialLastSpanID.split("_",3);//以 '_'分割，成3段字符串 result：(3) ["span", "input", "4"]
        var idSpanNumber = initialLastSpanIDInNumber[2];//4  idSpanNumber 用于加在新加span id属性后，作为序号用。
        idSpanNumber++;//5.6.7.....

        var spanTag = document.createElement("span");


        document.getElementById("voteSelect").append(spanTag);
        var AllElemLengthInvoteSelect=document.getElementById("voteSelect").childNodes.length;//22原为 var a  所有在 id为voteSelect的标签下所有的元素的长度。
        var spanTag = document.getElementById("voteSelect").childNodes.item(AllElemLengthInvoteSelect-1);/*<span></span>*/
        var idStr = "span_input_"+idSpanNumber;//准备设置id的内容：   "span_input_5"
        spanTag.setAttribute("id",idStr);//设置span_input_   +   idSpanNumber

        /*ok*/

        ////获取新增前span标签里  input标签中id值的序号
        // var addedLength = document.getElementById("voteSelect").childNodes.length;//重新拿长度:22。因为已经添加了<span>标签
        var initialLastSpan = document.getElementById("voteSelect").childNodes.item(a-index);/*a-2*/ //result: <span id="span_input_5"></span>
        var inputInSpan = initialLastSpan.childNodes.item(1);//result: <input type="text" id="vote_Option_4"> 在span标签里的input标签
        var inputIdInSpan = inputInSpan.getAttribute("id");///在span标签里的input标签 的id    result: vote_Option_4
        var inputIdInSpanStr = inputIdInSpan.split("_",3);///以 '_'分割，成3段字符串 result：(3) ["vote", "Option", "4"]
        var idInputNumber = inputIdInSpanStr[2];//4  idInputNumber 用于加在新加span里input中 id属性后，作为序号用。
        idInputNumber++;//5.6.7....得到新增结点前最后<span>标签中的id序号，加一后作为新加的<span>的id序号

        var btnTag = document.createElement("input");
        var brTag = document.createElement("br");
        //添加三个html元素
        document.getElementById(idStr).append("选项");
        document.getElementById(idStr).appendChild(btnTag);

        // var AllElemLengthInvoteSelect2=document.getElementById("voteSelect").childNodes.length;//22加了span后的新长度
        // var spanTag = document.getElementById("voteSelect").childNodes.item(AllElemLengthInvoteSelect2-1);/*<span></span>*/
        var spanTag = document.getElementById(idStr);
        var inputTag=spanTag.childNodes.item(1);
        var idStr2 = "vote_Option_"+idInputNumber;//"vote_Option_5"

        inputTag.setAttribute("type","text");//<input type="text">
        inputTag.setAttribute("id",idStr2);//<input id="vote_Option_5" type="text">
        // inputTag.setAttribute("name",idStr2);//<input id="vote_Option_5" type="text">

        document.getElementById("voteSelect").appendChild(brTag);
        document.getElementById("tagIndex").setAttribute("value",2);

        // var a=document.getElementById("voteSelect").childNodes.length;
        // var newSpanInput = document.getElementById(idStr).childNodes.item(1);//获取新增span 中input元素
        // newSpanInput.type="text";
        // newSpanInput.id=
        // var inputTag = document.getElementById("voteSelect").childNodes.item(a-3).lastElementChild;
        // inputTag.type="text";
        // inputTag.setAttribute("name","abcdefg");
    });
    $("#subtractOption").click(function () {
        var parent = document.getElementById("voteSelect");
        parent.lastChild.remove();
        parent.lastChild.remove();
        parent.lastChild.remove();
    });
</script>
<script>
    function isNull(){
        var votesName = document.getElementById("votesName");
        var startDate = document.getElementById("startDate");
        var endDate = document.getElementById("endDate");
        var voteSelect = document.getElementById("voteSelect");
        // var option=[];
        for(var childNOte in voteSelect.childList){
            console.log(childNOte.getElementsByTagName);
        }

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

        if(sign==0){
            $("#build").prop("type","submit");
        }else{
            alert("您还有未填选项！")
        }
    }
</script>
</html>
