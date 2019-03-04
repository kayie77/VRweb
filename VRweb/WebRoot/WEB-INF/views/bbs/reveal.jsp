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
<link href="/VRweb/resources/bbs/css/default/user.css" rel="stylesheet"
	type="text/css" />
</head>

<body>
	<div class="aw-top-menu-wrap">
		<%@ include file="/WEB-INF/views/bbs/head.jsp"%></div>
	<div class="aw-container-wrap">
		<div class="aw-container aw-wecenter aw-serch-result">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="aw-mod aw-mod-search-result">
							<div class="aw-mod-head">
								<div class="tabbable">
									<ul class="nav nav-tabs aw-reset-nav-tabs" id="list_nav">
										<li class=""><a href="#users" data-toggle="tab"
											id="page_users">用户</a></li>
										<li class=""><a href="#categories" data-toggle="tab"
											id="page_categories">学校</a></li>
										<li class=""><a href="#questions" data-toggle="tab"
											id="page_questions">问题</a></li>
										<li class="active"><a href="#all" data-toggle="tab"
											id="page_all">全部</a></li>

									</ul>
								</div>
							</div>
							<div class="aw-mod-body">
								<div class="aw-user-center-tab">
									<div class="tab-content">
										<div class="tab-pane active" id="all">
										
											<!-- 用户 -->
											<div class="aw-mod">
												<div class="aw-mod-head">
													<h3>
														<a class="pull-right aw-more-content" href="javascript:;"
															onclick="$('#page_users').click();">更多...</a> 用户
													</h3>
												</div>
												<div class="aw-mod-body">
												<div class="row">
													<c:forEach var="user" begin="0" end="5" items="${users}">
													<div class="col-sm-6 col-md-4">
															<div class="thumbnail">
															<img class="img-rounded" style="width:30px; height:30px;"
																src="/VRweb/resources/bbs/static/common/avatar-min-img.png" />
															<div class="caption">
																	<h3 class="text-center" >
																		<a href="/VRweb/user/${user.id}" class="aw-user-name">${user.username}</a>
																	</h3>
																	<p class=" text-center">
																		人气:<em class="aw-text-color-green">${user.AC}</em>
																		积分:<em class="aw-text-color-orange">${user.credit}</em>
																	</p>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
											</div>
											<!-- end 回复 -->

											<!-- 学校 -->
											<div class="aw-mod">
												<div class="aw-mod-head">
													<h3>
														<a class="pull-right aw-more-content" href="javascript:;"
															onclick="$('#page_categories').click();">更多...</a> 学校
													</h3>
												</div>
												<div class="aw-mod-body">
												<div class="row">
													<c:forEach var="category" begin="0" end="5" items="${categories}">
													<div class="col-sm-6 col-md-4">
															<div class="thumbnail">
														<img style="width:90px; height:90px;" src="/VRweb/resources/image/shoolLogo/${category.logo_img}.png" />
															<div class="caption">
																<h3 class="text-center ">
																	<a href="/VRweb/category/${category.id}">${category.name}</a>
																</h3>
																<p class="text-center text-muted">${category.AC}人浏览过该板块</p>
															</div>
														</div>
														</div>
													</c:forEach>
													</div>
												</div>
											</div>
											<!-- end 学校-->

											<!-- 问题 -->
											<div class="aw-mod">
												<div class="aw-mod-head">
													<h3>
														<a class="pull-right aw-more-content" href="javascript:;"
															onclick="$('#page_questions').click();">更多...</a> 问题
													</h3>
												</div>
												<div class="aw-mod-body">
													<c:forEach var="question" begin="0" end="5"
														items="${questions}">
														<div class="aw-item">
															<div class="aw-mod">
																<div class="aw-mod-head">
																	<h4 class="aw-hide-txt">
																		<a href="/VRweb/speak/${question.id}">${question.title}</a>
																	</h4>
																</div>
																<div class="mod-body">
																	<p class="aw-hide-txt">${question.AC}
																		次浏览&nbsp; <span class="aw-text-color-999"> <fmt:formatDate
																				value="${question.date}" pattern="yyyy-MM-dd hh:mma" />
																			&nbsp;由 <a href="/VRweb/user/${question.owner.id}">${question.owner.username}</a>&nbsp;提出
																		</span>
																	</p>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
											<!-- end 问题-->
										</div>

										<div class="tab-pane" id="questions">
											<div class="aw-mod">
												<div class="aw-mod-head">
													<h3>问题</h3>
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
																	<p class="aw-hide-txt">${question.AC}
																		次浏览&nbsp; <span class="aw-text-color-999"> <fmt:formatDate
																				value="${question.date}" pattern="yyyy-MM-dd hh:mma" />
																			&nbsp;由 <a href="/VRweb/user/${question.owner.id}">${question.owner.username}</a>&nbsp;提出
																		</span>
																	</p>
																</div>
															</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>

										<div class="tab-pane" id="categories">
											<div class="aw-mod">
												<div class="aw-mod-head">
													<h3>学校</h3>
												</div>
												<div class="aw-mod-body" id="category-item-container">
												<div class="row">
													<c:forEach var="category" items="${categories}">
														<div class="col-sm-6 col-md-4">
															<div class="thumbnail">
															<img style="width:90px; height:90px;" src="/VRweb/resources/image/shoolLogo/${category.logo_img}.png" />
																<div class="caption">
																<h3 class="text-center ">
																	<a href="/VRweb/category/${category.id}">${category.name}</a>
																</h3>
																<p class="text-center text-muted">${category.AC}人浏览过该板块</p>
															</div>
														</div>
														</div>
													</c:forEach>
												</div>
											</div>
										</div>
										</div>

										<div class="tab-pane" id="users">
											<div class="aw-mod">
												<div class="aw-mod-head">
													<h3>用户</h3>
												</div>
												<div class="aw-mod-body" id="user-item-container">
												<div class="row">
												<c:forEach var="user" begin="0" end="5" items="${users}">
													<div class="col-sm-6 col-md-4">
															<div class="thumbnail">
															<img class="img-rounded" style="width:30px; height:30px;"
																src="/VRweb/resources/bbs/static/common/avatar-min-img.png" />
															<div class="caption">
																	<h3 class="text-center" >
																		<a href="/VRweb/user/${user.id}" class="aw-user-name">${user.username}</a>
																	</h3>
																	<p class=" text-center">
																		人气:<em class="aw-text-color-green">${user.AC}</em>
																		积分:<em class="aw-text-color-orange">${user.credit}</em>
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
			</div>
		</div>
	</div>

	<a class="aw-back-top hidden-xs" href="javascript:;"
		onclick="$.scrollTo(1, 600, {queue:true});"> <i
		class="fa fa-arrow-up"></i>
	</a>
	<div>
		<span id="keyword" value="${keyword}" class="hide"></span>
	</div>
	<div id="navigation" align="center">
		<a href="/VRweb/bbs/search?keyword=${keyword}&page=2"></a>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#question-item-container").infinitescroll({
				navSelector : "#navigation",
				nextSelector : "#navigation a",
				itemSelector : "#question-item-container .aw-item",
				animate : true
			//加载时候时候需要动画，默认是false 
			});
		});
		$(document).ready(function() {
			$("#category-item-container").infinitescroll({
				navSelector : "#navigation",
				nextSelector : "#navigation a",
				itemSelector : "#category-item-container .col-sm-6 col-md-4",
				animate : true
			//加载时候时候需要动画，默认是false 
			});
		});
		$(document).ready(function() {
			$("#user-item-container").infinitescroll({
				navSelector : "#navigation",
				nextSelector : "#navigation a",
				itemSelector : "#user-item-container .col-sm-6 col-md-4",
				animate : true
			//加载时候时候需要动画，默认是false 
			});
		});

		function highLightKeyWord(node, key, color) {
			var NodeID = node || "";
			var keyWord = key || "";
			var keyColor = color || "red";
			var node = $(node); //可使用document.getElementById替换
			var separater = ' ';
			var keywords = keyWord.split(separater);
			if (NodeID != "" && keyWord != "") {
				node.each(function() {
					var html = $(this).html(); //可使用innerHTML替换
					for (var i = 0; i < keywords.length; ++i) {
						var pattern = new RegExp(keywords[i], "gi");
						html = html.replace(pattern,
								"<font color='" + keyColor + "'>" + keywords[i]
										+ "</font>");
					}
					$(this).html(html); //可使用innerHTML替换
				})
			}
		};

		$().ready(function() {
			var k = $("#keyword").attr("value");
			highLightKeyWord(".aw-item .aw-mod-head", k, "red");
		});
	</script>
</body>
</html>