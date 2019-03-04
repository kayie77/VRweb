<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page contentType="text/html;charset=gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="/VRweb/resources/bbs/js/editor/ckeditor.js"></script>
    <title>${question.title}</title>
</head>
<body>
    <div class="aw-top-menu-wrap">
        <%@ include file="/WEB-INF/views/bbs/head.jsp"%></div>
    <div class="aw-container-wrap">
        <div class="aw-container aw-wecenter">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 aw-global-tips"></div>
                </div>
            </div>
            <div class="container">
                <div class="row aw-content-wrap">
                    <div class="col-sm-12 col-md-9 aw-main-content">
                        <div class="aw-mod aw-item aw-question-detail-title">
                            <div class="aw-mod-head">
                                <h1>${question.title}</h1>

                                <div class="aw-topic-editor" id="question_topic_editor" data-type="question" data-id="21">
                                    <a href="/VRweb/category/${question.category.id}" class="aw-topic-name" data-id="13">
                                        <span>${question.category.name}</span>
                                    </a>

                                </div>

                            </div>
                            <div class="aw-mod-body">
                                <div class="aw-question-detail-txt markitup-box">${question.content}</div>
                                <div class="aw-question-detail-meta">
                                    <span class="aw-text-color-999">
                                        <fmt:formatDate value="${question.date}" pattern="yyyy-MM-dd hh:mma"/>
                                    </span>

                                    <a href="javascript:toggle_comments('#aw-comment-box${question.id}');" data-id="21" data-type="question" class="aw-add-comment aw-text-color-999" data-comment-count="0" data-first-click="hide"> <i class="fa fa-comment"></i>
                                        添加评论
                                    </a>
                                    <c:if test="${currUser!=null && currUser.id == question.owner.id}">
                                        <a class="aw-text-color-999" href="/VRweb/speak/publish/${question.id}"> <i class="fa fa-edit"></i>
                                            编辑
                                        </a>
                                    </c:if>
                                </div>
                            </div>

                            <div id="aw-comment-box${question.id}" style="display:none;">

                                <div class="aw-comment-list">
                                    <ul>
                                        <c:forEach var="comment" items="${question.comments}">
                                            <li id="comment-item-${comment.id}" style="padding-left:0;">
                                                <div >
                                                    <p class="clearfix">
                                                        <span class="pull-right">
                                                            <c:if test="${currUser!=null && currUser.id == comment.owner.id}">
                                                                <a class="aw-text-color-999" href="javascript:;" onclick="deleteComment('#comment-item-${comment.id}','${comment.id}');">删除</a>
                                                            </c:if>
                                                            <a href="javascript:;" onclick="$(this).parents('#aw-comment-box${question.id}').find('form textarea').insertAtCaret('@${comment.owner.username}:');$(this).parents('#aw-comment-box${question.id}').find('form').show().find('textarea').focus();$.scrollTo($(this).parents('#aw-comment-box${question.id}').find('form'), 300, {queue:true});">回复</a>
                                                        </span>
                                                        <a href="/VRweb/user/${comment.owner.id}" class="aw-user-name author" data-id="1920">${comment.owner.username}&nbsp</a>
                                                        &nbsp
                                                        <span>
                                                            <fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd hh:mma"/>
                                                        </span>
                                                    </p>
                                                    <p class="clearfix">${comment.content}</p>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <c:if test="${currUser!=null}">
                                    <form id="comment_form${question.id}" action="process/remark" method="post" >
                                        <input type="hidden" name="question_id" value="${question.id}">
                                        <input type="hidden" name="speak_id" value="${question.id}">
                                        <div class="aw-comment-box-main">
                                            <textarea id="comment-box-of-${question.id}" class="aw-comment-txt form-control" rows="2" name="comment" placeholder="评论一下..." style="overflow: hidden; word-wrap: break-word; resize: none; height: 34px;"></textarea>
                                            <div class="aw-comment-box-btn" style="display:block;">
                                                <span id="comment_error${question.id}" class="alert alert-danger hide pull-left"></span>
                                                <span class="pull-right">
                                                    <a href="javascript:;" class="btn btn-mini btn-success" onclick='if($("#comment-box-of-${question.id}").val().length<=5){a=$("#comment_error${question.id}");a.text("评论不能少于五个字");a.removeClass("hide");}else{$("#comment_form${question.id}").submit();};'>评论</a>
                                                </span>
                                            </div>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                            <!-- 站内邀请 -->
                            <!-- end 站内邀请 -->
                            <!-- 相关链接 -->
                            <!-- end 相关链接 --> </div>

                        <div class="aw-mod aw-question-comment-box">
                            <div class="aw-mod-head">
                                <ul class="nav nav-tabs aw-reset-nav-tabs">
                                    <li>
                                        <a href="/VRweb/speak/${question.id}?sort_key=time">
                                            时间
                                            <i class="fa fa-caret-up"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/VRweb/speak/${question.id}?sort_key=vote">票数</a>
                                    </li>

                                    <h2 class="hidden-xs">${answers.size()} 个回复</h2>
                                </ul>
                            </div>
                            <div class="aw-mod-body aw-dynamic-topic">
                                <c:forEach var="answer" items="${answers}">
                                    <div class="aw-item" uninterested_count="0" force_fold="0" id="answer_list_70">
                                        <a class="anchor" name="answer_70"></a>
                                        <!-- 用户头像 -->

                                        <!-- end 用户头像 -->
                                        <div class="aw-mod-body clearfix">
                                            <div class="aw-vote-bar pull-left" >
                                                <div class="vote-container" data-id="${answer.id}">
                                                    <a class="aw-border-radius-5 " href="javascript:;" onclick="supportVote(this, '#${answer.id}-vote', '${currUser.id}', '${answer.id}')">
                                                        <i data-original-title="赞同回复" class="fa fa-thumbs-o-up active" data-toggle="tooltip" title="" data-placement="right"></i>
                                                    </a> <em id="${answer.id}-vote" class="aw-border-radius-5 aw-vote-bar-count aw-hide-txt active">${answer.support-answer.oppose}</em>
                                                    <a class="aw-border-radius-5 " onclick="opposeVote(this, '#${answer.id}-vote', '${currUser.id}', '${answer.id}')">
                                                        <i data-original-title="对回复持反对意见" class="fa fa-thumbs-o-down" data-toggle="tooltip" title="" data-placement="right"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- 投票栏 -->

                                            <!-- end 投票栏 -->
                                            <div class="pull-left aw-dynamic-topic-content">
                                                <div class="mod-head">
                                                    <p>
                                                        <a class="aw-user-name" href="/VRweb/user/${answer.owner.id}" >${answer.owner.username}</a>
                                                        -
                                                        <span class="aw-text-color-999">${answer.owner.oneWord}</span>
                                                    </p>
                                                </div>
                                                <div class="mod-body">
                                                    <!-- 评论内容 -->

                                                    <div class="markitup-box">${answer.content}</div>

                                                    <!-- end 评论内容 --> </div>
                                                <!-- 社交操作 -->
                                                <div class="mod-footer aw-dynamic-topic-meta">
                                                    <span class="aw-text-color-999">
                                                        <fmt:formatDate value="${answer.date}" pattern="yyyy-MM-dd hh:mma"/>
                                                    </span>
                                                    <a class="aw-add-comment aw-text-color-999" data-id="70" data-type="answer" data-comment-count="0" data-first-click="hide" href="javascript:toggle_comments('#aw-comment-box${answer.id}');">
                                                        <i class="fa fa-comment"></i>
                                                        添加评论
                                                    </a>
                                                </div>
                                                <!-- end 社交操作 --> </div>
                                        </div>

                                        <div id="aw-comment-box${answer.id}" style="display:none;">

                                            <div class="aw-comment-list">
                                                <ul>
                                                    <c:forEach var="comment" items="${answer.comments}">
                                                        <li id="comment-item-${comment.id}" style="padding-left:0;">
                                                            <div >
                                                                <p class="clearfix">
                                                                    <span class="pull-right">
                                                                        <c:if test="${currUser!=null && currUser.id == comment.owner.id}">
                                                                            <a class="aw-text-color-999" href="javascript:;" onclick="deleteComment('#comment-item-${comment.id}','${comment.id}');">删除</a>
                                                                        </c:if>
                                                                        <a href="javascript:;" onclick="$(this).parents('#aw-comment-box${answer.id}').find('form textarea').insertAtCaret('@${comment.owner.username}:');$(this).parents('#aw-comment-box${answer.id}').find('form').show().find('textarea').focus();$.scrollTo($(this).parents('#aw-comment-box${answer.id}').find('form'), 300, {queue:true});">回复</a>
                                                                    </span>
                                                                    <a href="/VRweb/user/${comment.owner.id}" class="aw-user-name author" data-id="1920">${comment.owner.username}&nbsp</a>
                                                                    &nbsp
                                                                    <span>
                                                                        <fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd hh:mma"/>
                                                                    </span>
                                                                </p>
                                                                <p class="clearfix">${comment.content}</p>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            <c:if test="${currUser!=null}">
                                                <form id="comment_form${answer.id}" action="process/remark" method="post" >
                                                    <input type="hidden" name="question_id" value="${question.id}">
                                                    <input type="hidden" name="speak_id" value="${answer.id}">
                                                    <div class="aw-comment-box-main" style="background:white;">
                                                        <textarea id="comment-box-of-${answer.id}" class="aw-comment-txt form-control" rows="2" name="comment" placeholder="评论一下..." style="overflow: hidden; word-wrap: break-word; resize: none; height: 34px;"></textarea>
                                                        <div class="aw-comment-box-btn" style="display:block;">
                                                            <span id="comment_error${answer.id}" class="alert alert-danger hide pull-left"></span>
                                                            <span class="pull-right">
                                                                <a href="javascript:;" class="btn btn-mini btn-success" onclick='if($("#comment-box-of-${answer.id}").val().length<=5){a=$("#comment_error${answer.id}");a.text("评论不能少于五个字");a.removeClass("hide");}else{$("#comment_form${answer.id}").submit();};'>评论</a>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if>
                                        </div>

                                    </div>
                                </c:forEach>
                            </div>
                            <div class="aw-mod-footer"></div>
                        </div>
                        <!-- end 问题详细模块 -->

                        <!-- 回复编辑器 -->

                        <div class="aw-mod aw-mod-replay-box">
                            <c:if test="${currUser==null}">
                                <p align="center">
                                    要回复问题请先
                                    <a href="../user/login">登录</a>
                                    或
                                    <a href="../user/register">注册</a>
                                </p>
                            </c:if>
                            <c:if test="${currUser!=null}">
                                <form action="process/answer"  method="post" id="answer_form">
                                    <input type="hidden" name="question_id" value="${question.id}">
                                    <div class="aw-mod-head"></div>
                                    <div class="editor">
                                        <textarea name="answer" id="answer" ></textarea>
                                        <script>
                                            CKEDITOR.replace('answer',{
                                                autoGrow_minHeight: 382,
                                                resize_enabled: false
                                            });
                                        </script>
                                        <p></p>
                                        <div class="aw-replay-box-control clearfix">
                                            <a href="javascript:;" onclick="$('#answer_form').submit();" class="btn btn-large btn-success pull-right btn-publish-submit">回复</a>
                                        </div>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                        <!-- end 回复编辑器 --> </div>
                    <!-- 侧边栏 -->
                    <div class="col-md-3 aw-side-bar hidden-xs hidden-sm">
                        <!-- 发起人 -->
                        <div class="aw-side-bar-mod">
                            <div class="aw-mod-head">
                                <h3>发起人</h3>
                            </div>
                            <div class="aw-mod-body">
                                <dl>
                                <dd class="pull-left" style="width:30px; height:30px;">
											<img class="img-rounded" style="width:30px; height:30px;"
												src="/VRweb/resources/bbs/static/common/avatar-min-img.png" />
								</dd>
                                    <dd class="pull-right" style="width:135px; height:30px;">
                                        <a class="aw-user-name" href="/VRweb/user/${question.owner.id}">${question.owner.username}</a>
                                        <p>${question.owner.oneWord}</p>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <!-- end 发起人 -->

                        <!-- 问题状态 -->
                        <div class="aw-side-bar-mod aw-side-bar-mod-question-status">
                            <div class="aw-mod-head">
                                <h3>问题状态</h3>
                            </div>
                            <div class="aw-mod-body">
                                <ul>
                                    <li>
                                        浏览:
                                        <span class="aw-text-color-blue">${question.AC}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- end 问题状态 --> </div>
                    <!-- end 侧边栏 --> </div>
            </div>
        </div>
    </div>
    <div class="aw-footer-wrap">
        <div class="aw-footer aw-wecenter">
            Copyright 2015 - 全景校园BBS , All Rights Reserved
        </div>
    </div>
	<div><span id="currUser-id" value="${currUser.id}"></div>


    <script type="text/javascript">     
        (function($){
        $.fn.extend({
            insertAtCaret: function(myValue){
                var $t=$(this)[0];
                if (document.selection) {
                    this.focus();
                    sel = document.selection.createRange();
                    sel.text = myValue;
                    this.focus();
                }
                else
                    if ($t.selectionStart || $t.selectionStart == '0') {
                        var startPos = $t.selectionStart;
                        var endPos = $t.selectionEnd;
                        var scrollTop = $t.scrollTop;
                        $t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
                        this.focus();
                        $t.selectionStart = startPos + myValue.length;
                        $t.selectionEnd = startPos + myValue.length;
                        $t.scrollTop = scrollTop;
                    }
                    else {
                        this.value += myValue;
                        this.focus();
                    }
                }
             });
        })(jQuery);

        function toggle_comments(box){
            target = $(box);
            if(target.css("display")=="none"){
                target.css({display:"block"});
            }else{
                target.css({display:"none"});
            }
        };
        
        function comment_valid(){
            if($("#comment-box-of-${answer.id}").val().length()<5)
            {
                $(".comment_error").text("回复不能少于五个字");
            }else{
                $("#comment_form").submit();
            }
        };
        
        function supportVote(object,vote,user_id,answer_id){
            data = "user_id="+user_id+"&"+"answer_id="+answer_id;
            $.post(
                "ajax/support",
                data,
                function(result){   
                    if(result=="refuse")return;     
                    r = parseInt(result);
                    old_v = parseInt($(vote).text());
                    if(r - old_v > 0){
                      $(object).addClass("active");
                    }else if(r - old_v < 0){
                      $(object).removeClass("active");  
                    }
                    $(vote).text(r);
                },
                "text");
        };
        
       function opposeVote(object,vote,user_id,answer_id){
            data = "user_id="+user_id+"&"+"answer_id="+answer_id;
            $.post(
                "ajax/oppose",
                data,
                function(result){
                    if(result=="refuse")return; 
                    r = parseInt(result);
                    old_v = parseInt($(vote).text());
                    if(r - old_v < 0){
                      $(object).addClass("active");
                    }else if(r - old_v > 0){
                      $(object).removeClass("active");  
                    }
                    $(vote).text(r);
                },
                "text");
        };
        
        function deleteComment(odject,id){
            id = parseInt(id);
            $("#bt-cfm-del-comment").click(function(){
                    data="speak_id="+id;
                    $.post(
                        "ajax/deleteSpeak",
                        data,
                        function(result){
                            if(result=="success"){
                                $(odject).remove();
                            }
                        },
                        "text");    
                });
            $('#cfrm-del').modal({
             keyboard: false,
             backdrop:"static"
            });
        };
    
        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
            }
            
            $().ready(function(){ 
                if(getQueryString("error")!=null){
                    $(".error_message").removeClass("hide");
                }
        });
        
        $().ready(function(){ 
        sortkey = getQueryString("sort_key");
        if(sortkey!=null){
            if(sortkey == "time")
                 $(".aw-reset-nav-tabs li:nth-child(1)").addClass("active");
            else{
                 $(".aw-reset-nav-tabs li:nth-child(2)").addClass("active");
            }
        }else{
            $(".aw-reset-nav-tabs li:nth-child(2)").addClass("active");
        }
    });
    
    $(document).ready(function (){
    		u_id = parseInt($("#currUser-id").attr("value"));
    		if(isNaN(u_id)){
    			return;
    		}
			$(".vote-container").each(function(){
			   var  a_id = parseInt($(this).attr("data-id"));
			   var data = "uid="+u_id+"&aid="+a_id;
			   var this_ = this;
			    $.post(
                        "ajax/getuservotestatus",
                        data,
                        function(result){
                            if(result=="support"){
                                $(this_).children("a:eq(0)").addClass("active");
                            }else if(result=="oppose"){
                            	$(this_).children("a:eq(1)").addClass("active");
                            }
                        },
                        "text"); 
			  });
		 }); 
    </script>
</body>
</html>