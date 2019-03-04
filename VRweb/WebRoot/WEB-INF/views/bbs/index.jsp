<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page contentType="text/html;charset=gbk"%>
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
<title>首页 360全景校园论坛</title>
<style type="text/css">
</style>

</head>

<body>
	<div class="aw-top-menu-wrap">
		<%@ include file="/WEB-INF/views/bbs/head.jsp"%></div>

	<div class="aw-container-wrap">
		<div class="aw-container aw-wecenter">
			<div class="container">
				<div class="row aw-content-wrap">
					<div class="col-sm-12 col-md-9 aw-main-content aw-all-question">
						<!-- tab切换 -->
						<ul class="nav nav-tabs aw-reset-nav-tabs hidden-xs">
							<li class="active"><a href="javascript:;"
								id="sort_control_hot">热门</a></li>
							<h2 class="hidden-xs">问题</h2>
						</ul>
						<!-- end tab切换 -->

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
													href="#"> 浏览 <span class="text-muted ">${question.AC}</span>
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
														&nbsp;由 <a href="/VRweb/user/${question.owner.id}">${question.owner.username}</a>&nbsp;提出
													</span>
												</p>
											</div>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>


					</div>

					<!-- 侧边栏 -->
					<div
						class="col-sm-12 col-md-3 aw-side-bar aw-index-side-bar hidden-xs hidden-sm">
						<div class="aw-side-bar-mod aw-text-align-justify">
							<div class="aw-mod-head">
								<h3>热门学校</h3>
							</div>
							<div class="aw-mod-body">
								<c:forEach var="category" items="${categories}">
									<dl>
										<dd class="pull-left" style="width:30px; height:30px;">
											<img class="img-rounded" style="width:30px; height:30px;"
												src="/VRweb/resources/image/shoolLogo/${category.logo_img}.png" />
										</dd>
										<dd class="pull-right" style="width:135px; height:30px;">
											<a href="/VRweb/category/${category.id}"
												class="aw-topic-name" data-id="2"> <span>${category.name}</span>
											</a>

										</dd>
									</dl>
								</c:forEach>

							</div>
						</div>

						<div
							class="aw-side-bar-mod aw-text-align-justify aw-no-border-bottom">
							<div class="aw-mod-head">
								<h3>热门用户</h3>
							</div>
							<div class="aw-mod-body">
								<c:forEach var="user" items="${users}">
									<dl>
										<dd class="pull-left" style="width:30px; height:30px;">
											<img class="img-rounded" style="width:30px; height:30px;"
												src="/VRweb/resources/bbs/static/common/avatar-min-img.png" />
										</dd>
										<dd class="pull-right" style="width:135px; height:30px;">
											<a href="/VRweb/user/${user.id}" data-id="1914"
												class="aw-user-name">${user.username}</a>

										</dd>
									</dl>
								</c:forEach>

							</div>
						</div>
					</div>
				</div>

				<!-- end 侧边栏 -->
			</div>
			<div id="navigation" align="center">
				<a href="/VRweb/bbs/index?page=2"></a>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		 $(document).ready(function (){
			  $("#infinite-question-container").infinitescroll({
			        navSelector: "#navigation",
			        nextSelector: "#navigation a",
			        itemSelector: ".aw-question-list .aw-item",          
			        animate: true                       //加载时候时候需要动画，默认是false 
			    });
		 }); 
    </script>
</body>
</html>