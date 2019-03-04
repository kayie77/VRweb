<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<title>学校分类 360全景校园论坛</title>
<style type="text/css">
.aw-topic-detail-title .aw-mod-body .media .media-left img {
	  box-shadow: 0 0px 0px #FFFFFF;
}
</style>

</head>

<body>
	<div class="aw-top-menu-wrap">
		<%@ include file="/WEB-INF/views/bbs/head.jsp"%></div>

	<div class="aw-container-wrap">
		<div class="container">
			<div class="row aw-content-wrap">
				<div
					class="col-sm-12 col-md-9 aw-main-content aw-topic-detail-content">
					<div class="aw-mod aw-topic-detail-title">
						<div class="aw-mod-body">
							<div class="media">
								<div class="media-left">
									<img style="margin-top: 20px; width:60px; height:60px;" class="media-object"
										src="/VRweb/resources/image/shoolLogo/${category.logo_img}.png">
									<div class="media-body">
										<h2 class="pull-left">${category.name}</h2>
									</div>
								</div>
							</div>
							<p class="aw-topic-detail-title-follow aw-text-color-999">
								${category.AC}人浏览过该板块 <br>
							</p>
						</div>
					</div>
					<div class="aw-mod aw-topic-list-mod">
						<div class="aw-mod-head">
							<div class="tabbable">
								<!-- tab 切换 -->
								<ul
									class="nav nav-tabs aw-reset-nav-tabs aw-topic-detail-tabs hidden-xs">
									<li class="active"><a href="#questions" data-toggle="tab">全部问题</a>
									</li>
								</ul>
								<!-- end tab 切换 -->
							</div>
						</div>
						<div class="aw-mod aw-question-box-mod">
							<div class="aw-mod-body">
								<div class="aw-question-list" id="infinite-question-container">
									<c:forEach var="question" items="${questions}">
										<div class="aw-item ">
											<ul class="nav-pills" role="tablist" style="float:right ;">
												<li role="presentation" style="padding: 10 3;"><a
													href="#"> 评论 <span class="text-muted">${question.comments.size()}</span>
												</a></li>
												<li role="presentation" style="padding: 10 3;"><a
													href="#"> 回答 <span class="text-muted">${question.answers.size()}</span>
												</a></li>
												<li role="presentation" style="padding: 10 3;"><a
													href="#"> 浏览 <span class="text-muted">${question.AC}</span>
												</a></li>
											</ul>
											<div class="aw-question-content">
												<h4>
													<a href="/VRweb/speak/${question.id}">${question.title}</a>
												</h4>
												<p>
													<a href="/VRweb/category/${question.category.id}"
														class="aw-topic-name" data-id="13"> <span>${question.category.name}</span>
													</a> <span class="aw-text-color-999"> <fmt:formatDate
															value="${question.date}" pattern="yyyy-MM-dd hh:mma" />
														&nbsp; <a href="/VRweb/user/${question.owner.id}">${question.owner.username}</a>
													</span>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 侧边栏 -->
				<div
					class="col-sm-12 col-md-3 aw-side-bar aw-side-bar-topic-detail hidden-xs">
					<!-- 话题描述 -->
					<div class="aw-side-bar-mod aw-text-align-justify">
						<div class="aw-mod-head">
							<h3>板块描述</h3>
						</div>
						<div class="aw-mod-body">
							<p>${category.cateDescribe}</p>
						</div>
					</div>
					<!-- end 话题描述 -->

					<div class="aw-side-bar-mod aw-side-bar-topic-about">
						<div class="aw-mod-head">
							<h3>相关话题</h3>
						</div>
						<div class="aw-mod-body aw-topic-editor" data-type="topic"
							data-id="13"></div>
					</div>
				</div>
			</div>
			<div id="navigation" align="center">
				<a href="/VRweb/bbs/index?page=2"></a>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#infinite-question-container").infinitescroll({
				navSelector : "#navigation",
				nextSelector : "#navigation a",
				itemSelector : ".aw-question-list .aw-item",
				animate : true
			//加载时候时候需要动画，默认是false 
			});
		});
	</script>
</body>
</html>