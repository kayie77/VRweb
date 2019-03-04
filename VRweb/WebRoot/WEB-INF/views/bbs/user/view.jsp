<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page contentType="text/html;charset=gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="/VRweb/resources/bbs/css/default/user.css" rel="stylesheet"
    type="text/css" />
</head>

<body>
    <div class="aw-top-menu-wrap">
        <%@ include file="/WEB-INF/views/bbs/head.jsp"%>
    </div>
    <div class="aw-container-wrap">
        <div class="aw-container aw-wecenter">
            <div class="container">
                <div class="row aw-content-wrap">
                    <div class="col-sm-12 col-md-9 aw-main-content">
                        <!-- 用户数据内容 -->
                        <div class="aw-mod aw-user-detail-box">
                            <div class="aw-mod-head" style="padding-left: 20">
                                <span class="pull-right aw-user-follow-box">
                                    <c:if test="${currUser.id==user.id}">
                                        <a href="/VRweb/user/curruser?update" class="btn btn-mini btn-success">编辑</a> 
                                    </c:if>
                                    <c:if test="${currUser!=null and currUser.id!=user.id}">
                                        <a href="javascript:;" class="btn btn-mini btn-default aw-active" id="focus-btn" data-uid="${currUser.id}"  data-fid="${user.id}" onclick="focus_people(this, ${currUser.id}, ${user.id});">关注</a>
                                    </c:if>                             
                                </span>
                                    
                                <h1>${user.username}</h1>
                                <p class="aw-text-color-999">${user.oneWord}</p>
                                <p class="aw-user-flag">
                                    <span class="aw-text-color-666">
                                        <i class="fa fa-home"></i>
                                        主页访问量 : ${user.AC}次访问   
                                    </span>
                                </p>
                            </div>
                            <div class="aw-mod-body">
                                <div class="aw-user-center-follow-meta">
                                    <span><i class="fa fa-signal"></i> 积分 : <em
                                        class="aw-text-color-orange">${user.credit}</em>
                                    </span>                                                             
                                </div>

                            </div>
                            <div class="aw-mod-footer">
                                <ul class="nav">
                                    <li class="active"><a href="#overview" id="page_overview"
                                        data-toggle="tab">概述</a>
                                    </li>
                                    <li><a href="#questions" id="page_questions"
                                        data-toggle="tab">发问</a>
                                    </li>
                                    <li><a href="#answers" id="page_answers" data-toggle="tab">回复</a>
                                    </li>
                                    <li><a href="#focus" id="page_focus" data-toggle="tab">关注列表</a>
                                    </li>
                                    <li><a href="#detail" id="page_detail" data-toggle="tab">详细资料</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- end 用户数据内容 -->
                        <div class="aw-user-center-tab">
                            <div class="tab-content">
                                <div class="tab-pane active" id="overview">
                                    <!-- 回复 -->
                                    <div class="aw-mod">
                                        <div class="aw-mod-head">
                                            <h3>
                                                <a class="pull-right aw-more-content" href="javascript:;"
                                                    onclick="$('#page_answers').click();">更多 ...</a>回复
                                            </h3>
                                        </div>
                                        <div class="aw-mod-body">
                                            <c:forEach var="answer" begin="0" end="5" items="${answers}">
                                                <div class="aw-item">
                                                    <div class="aw-mod">
                                                        <div class="aw-mod-head">
                                                            <h4 class="aw-hide-txt">
                                                                <a href="/VRweb/speak/${answer.question.id}">${answer.question.title}</a>
                                                            </h4>
                                                        </div>
                                                        <div class="mod-body">
                                                            <p class="aw-hide-txt">${answer.content}
                                                                <span class="aw-text-color-999">
                                                                     <fmt:formatDate value="${answer.date}" pattern="yyyy-MM-dd hh:mma"/>
                                                                     &nbsp;回答
                                                                </span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>                        
                                        </div>
                                    </div>
                                    <!-- end 回复 -->

                                    <!-- 发问 -->
                                    <div class="aw-mod">
                                        <div class="aw-mod-head">
                                            <h3>
                                                <a class="pull-right aw-more-content" href="javascript:;"
                                                    onclick="$('#page_questions').click();">更多...</a>发问
                                            </h3>
                                        </div>
                                        <div class="aw-mod-body">
                                            <c:forEach var="question" begin="0" end="5" items="${questions}">
                                                <div class="aw-item">
                                                    <div class="aw-mod">
                                                        <div class="aw-mod-head">
                                                            <h4 class="aw-hide-txt">
                                                                <a href="/VRweb/speak/${question.id}">${question.title}</a>
                                                            </h4>
                                                        </div>
                                                        <div class="mod-body">
                                                            <p class="aw-hide-txt">${question.AC} 次浏览&nbsp;
                                                                    <span class="aw-text-color-999">
                                                                        <fmt:formatDate value="${question.date}" pattern="yyyy-MM-dd hh:mma"/>
                                                                        &nbsp;提出
                                                                    </span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <!-- end 发问 -->

                                </div>

                                <div class="tab-pane" id="questions">
                                    <div class="aw-mod">
                                        <div class="aw-mod-head">
                                            <h3>回复</h3>
                                        </div>
                                        <div class="aw-mod-body" id="question-item-container">
                                            <c:forEach var="question" items="${questions}">
                                                    <div class="aw-item">
                                                        <div class="aw-mod">
                                                            <div class="aw-mod-head">
                                                                <h4 class="aw-hide-txt">
                                                                    <a href="/VRweb/speak/${question.id}">${question.title}</a>
                                                                </h4>
                                                            </div>
                                                            <div class="mod-body">
                                                                <p class="aw-hide-txt">${question.AC} 次浏览&nbsp;
                                                                    <span class="aw-text-color-999">
                                                                        <fmt:formatDate value="${question.date}" pattern="yyyy-MM-dd hh:mma"/>
                                                                        &nbsp;提出
                                                                    </span>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="tab-pane" id="answers">
                                    <div class="aw-mod">
                                        <div class="aw-mod-head">
                                            <h3>回复</h3>
                                        </div>
                                        <div class="aw-mod-body" id="answer-item-container">
                                            <c:forEach var="answer" items="${answers}">
                                                <div class="aw-item">
                                                    <div class="aw-mod">
                                                        <div class="aw-mod-head">
                                                            <h4 class="aw-hide-txt">
                                                                <a href="/VRweb/speak/${answer.question.id}">${answer.question.title}</a>
                                                            </h4>
                                                        </div>
                                                        <div class="mod-body">
                                                            <p class="aw-hide-txt">${answer.content}
                                                                <span class="aw-text-color-999">
                                                                     <fmt:formatDate value="${answer.date}" pattern="yyyy-MM-dd hh:mma"/>
                                                                     &nbsp;回答
                                                                </span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>    
                                        </div>
                                    </div>
                                </div>


                                <div class="tab-pane" id="detail">
                                    <div class="aw-mod">
                                        <div class="aw-mod-head">
                                            <h3>详细资料</h3>
                                        </div>
                                        <div class="aw-mod-body aw-user-center-details">
                                                <dl>
                                                <dd><b>账户名：</b>${user.username}</dd></br></br>
                                                <dd><b>性别：</b>${user.sex}</dd></br></br>
                                                <dd><b>一句话介绍：</b>${user.oneWord}</dd></br></br>
                                                <dd><b>详细介绍：</b>${user.personalDescribe}</dd></br></br>
                                            </dl>

                                        </div>
                                    </div>
                                </div>
                                
                                <div class="tab-pane" id="focus">
                                    <div class="aw-mod">
                                        <div class="aw-mod-head">
                                            <h3>关注</h3>
                                        </div>
                                        <div class="aw-mod-body" id="focus-item-container">
                                            <c:forEach var="user" items="${focuslList}">
                                                <div class="aw-item">
                                                    <div class="aw-mod">
                                                        <div class="aw-mod-head">
                                                            <h4 class="aw-hide-txt">
                                                                <a href="/VRweb/user/${user.id}" class="aw-user-name">${user.username}</a>&nbsp;${user.oneWord}                                                                      
                                                            </h4>
                                                        </div>
                                                        <div class="mod-body">
                                                            <p class="aw-hide-txt">
                                                                <span>
                                                                    <i class="fa fa-tag"></i>人气:<em class="aw-text-color-green">${user.AC}</em>
                                                                </span>
                                                                <span>
                                                                    <i class="fa fa-signal"></i>积分:<em class="aw-text-color-orange">${user.credit}</em>
                                                                </span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <a class="aw-back-top hidden-xs" href="javascript:;"
        onclick="$.scrollTo(1, 600, {queue:true});"><i
        class="fa fa-arrow-up"></i>
    </a>
    <div id="navigation" align="center">  
            <a href="/VRweb/user/${user.id}?page=2"></a> 
    </div> 
    <script type="text/javascript">
         $(document).ready(function (){
             $("#question-item-container").infinitescroll({
                    navSelector: "#navigation",
                    nextSelector: "#navigation a",
                    itemSelector: "#question-item-container .aw-item",          
                    animate: true                       //加载时候时候需要动画，默认是false 
                });
         }); 
         $(document).ready(function (){
             $("#answer-item-container").infinitescroll({
                    navSelector: "#navigation",
                    nextSelector: "#navigation a",
                    itemSelector: "#answer-item-container .aw-item",          
                    animate: true                       //加载时候时候需要动画，默认是false 
                });
         });
         $(document).ready(function (){
            $("#focus-item-container").infinitescroll({
                    navSelector: "#navigation",
                    nextSelector: "#navigation a",
                    itemSelector: "#focus-item-container .aw-item",          
                    animate: true                       //加载时候时候需要动画，默认是false 
                });
         });
         
         function focus_people(object,uid,fid){
            var data = "uid="+uid+"&fid="+fid;
            $.post(
                    "ajax/focususer",
                     data,
                     function(result){
                            if(result=="focus"){
                                $(object).removeClass("aw-active");
                                $(object).text("取消关注");
                            }else if(result=="unfocus"){
                                $(object).addClass("aw-active");
                                $(object).text("关注");
                            }
                        },
                        "text");    
         };
         
         $(document).ready(function (){
            object = $("#focus-btn");
            if(object.length>0){
                var uid = parseInt(object.attr("data-uid"));
                var fid = parseInt(object.attr("data-fid"));
                var data = "uid="+uid+"&fid="+fid;
                $.post(
                    "ajax/getfocusstatus",
                     data,
                     function(result){
                            if(result=="focus"){
                                $(object).removeClass("aw-active");
                                $(object).text("取消关注");
                            }else if(result=="unfocus"){
                                $(object).addClass("aw-active");
                                $(object).text("关注");
                            }
                        },
                        "text");    
            }
         });
    </script>
</body>
</html>