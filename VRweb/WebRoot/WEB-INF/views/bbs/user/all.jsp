<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div class="aw-top-menu-wrap">
		<%@ include file="/WEB-INF/views/bbs/head.jsp"%>
	</div>
	<div class="aw-container-wrap">
		<div class="aw-container aw-wecenter">
			<div class="container aw-user-sort">
				<div class="row">
					<div class="col-sm-12 col-md-12 aw-user-sort-title">
						<h3 class="pull-left">用户推荐</h3>
						<ul class="nav nav-tabs aw-reset-nav-tabs pull-right">
						</ul>
					</div>
				</div>
				<div class="row active">
					<div class="col-sm-12 col-md-3 side-nav clearfix">
						<ul>
						</ul>
					</div>
					<div class="col-sm-12 col-md-9 content">
						<div class="aw-mod">
							<div class="aw-mod-body" id="user-container">
							<c:forEach var="user" items="${userList}">
								<div class="aw-item">
									<p class="aw-text-color-999 title">
									<img class="img-rounded" src="/VRweb/resources/bbs/static/common/avatar-min-img.png" />
										<a href="/VRweb/user/${user.id}" class="aw-user-name">${user.username}</a> &nbsp;
										${user.oneWord}
									</p>
									<p class="aw-user-center-follow-meta">
										<span><i class="fa fa-tag"></i>人气: <em class="aw-text-color-green">${user.AC}</em></span>
										<span><i class="fa fa-signal"></i>积分: <em class="aw-text-color-orange">${user.credit}</em></span>
									</p>
								</div>								
								</c:forEach>
								<div id="navigation" align="center">  
							        	<a href="/VRweb/user/?page=2"></a> 
							    </div> 					
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="aw-footer-wrap">
		<div class="aw-footer aw-wecenter">
 Copyright  2015 - 全景校园BBS , All Rights Reserved
		</div>
	</div>

	<a class="aw-back-top hidden-xs" href="javascript:;"
		onclick="$.scrollTo(1, 600, {queue:true});"><i
		class="fa fa-arrow-up"></i>
	</a>
     <script type="text/javascript">
		 $(document).ready(function (){
			  $("#user-container").infinitescroll({
			        navSelector: "#navigation",
			        nextSelector: "#navigation a",
			        itemSelector: ".aw-mod-body .aw-item",          
			        animate: true                       //加载时候时候需要动画，默认是false 
			    });
		 }); 
    </script>

</body>
</html>