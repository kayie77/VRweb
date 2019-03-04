<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page contentType="text/html;charset=gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>登录 360全景校园论坛</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="/VRweb/resources/bbs/css/default/img/favicon.png"
	rel="shortcut icon" type="image/x-icon" />

<link rel="stylesheet" type="text/css"
	href="/VRweb/resources/bbs/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="/VRweb/resources/bbs/css/font-awesome.css" />
<link rel="stylesheet" type="text/css"
	href="/VRweb/resources/bbs/css/aw-font.css" />

<link href="/VRweb/resources/bbs/css/default/common.css"
	rel="stylesheet" type="text/css" />
<link href="/VRwebresources/bbs/css/default/link.css" rel="stylesheet"
	type="text/css" />
<link href="/VRweb/resources/bbs/js/plug_module/style.css"
	rel="stylesheet" type="text/css" />
<link href="/VRweb/resources/bbs/css/default/login.css" rel="stylesheet"
	type="text/css" />

<script src="/VRweb/resources/bbs/js/jquery.2.js" type="text/javascript"></script>

<script type="text/javascript">
    function getQueryString(name) {//获取某个url中所带的参数
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
    }
    
    $().ready(function(){ //如果参数error不为空，则显示用户名或者密码错误
        if(getQueryString("error")!=null){
            $(".error_message").removeClass("hide");
        }
    });
    
	</script>

</head>

</head>
<body>
	<div id="wrapper" class="clearfix">
		<div class="aw-login-wrap clearfix" style="margin-bottom: 150px;">
			<!-- 登陆框 -->
			<div class="aw-login-box pull-right">
				<div class="aw-mod">
					<div class="aw-mod-head">
						<a href="register" class="b-new-user pull-right">注册新用户</a> <i
							class="fa fa-user"></i> <span class="hidden-xs">登录</span>
					</div>
					<div class="aw-mod-body">
						<form id="login_form" method="post" action="process/login">
							<input type="hidden" name="return_url" value="" />
							<ul>
								<li><label class="aw-label-icon pull-left"
									for="aw-login-user-name"> <i class="fa fa-user"></i>
								</label> <input type="text" id="aw-login-user-name" class="form-control"
									placeholder="用户名" name="username" /></li>
								<li><label class="aw-label-icon pull-left"
									for="aw-login-user-password"> <i class="fa fa-key"></i>
								</label> <input type="password" id="aw-login-user-password"
									class="form-control" placeholder="密码" name="password" /></li>
								<li class="alert alert-danger hide error_message"><i
									class="fa fa-times"></i> <em>用户名密码不正确</em></li>
								<li class="last"><a href="javascript:;"
									onclick="$('#login_form').submit();" id="login_submit"
									class="pull-right btn btn-large btn-success">登录</a></li>
							</ul>
						</form>
					</div>
					<div class="aw-mod-footer"></div>
				</div>
			</div>
			<!-- end 登陆框 -->
			<!-- 左侧文字介绍部分 -->
			<h1 class="hidden-xs">
				<p>全景校园BBS 是一个针对广西高校资源信息分享交流的平台</p>
			</h1>
			<div class="aw-login-state hidden-xs">
				<p>
					欢迎来到 全景校园BBS 问答社区，你想知道的一切，或许答案都在这里。 <br /> <span>2.0 正式版发布！</span>
				</p>
				<p class="hide">庆祝 Y Know问答 2.0 正式发布</p>
				<p class="hide">
					全景校园BBS 是一个新型的社区建站程序，包括了问答，维基，以及社交等丰富而又轻量化的功能。 <br /> <span>这将是您的最好选择！</span>
				</p>
			</div>
			<!-- end 左侧文字介绍部分 -->

			<div class="aw-login-box-bg hidden-xs"></div>
		</div>
		<!-- 背景切换 -->
		<div class="aw-bg-wrap hidden-xs">
			<ul id="aw-bg-loading">
				<li
					style="height: 590px;background-image: url(/VRweb/resources/image/skdslider/gm1.jpg);"></li>
			</ul>
		</div>
		<!-- end 背景切换 -->
	</div>

	<div class="aw-footer-wrap">
		<div class="aw-footer aw-wecenter">Copyright 2015 - 全景校园BBS ,All Rights Reserved</div>
	</div>

</body>
</html>