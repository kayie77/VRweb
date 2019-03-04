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
<link rel="stylesheet" type="text/css" href="/VRweb/resources/css/index.css" />
<style type="text/css">
.row {
	margin-top: 30px;
}
</style>
</head>

<body>
	<div class="aw-top-menu-wrap">
		<%@ include file="/WEB-INF/views/bbs/head.jsp"%>
	</div>

	<div class="container">
		<div class="page-header">
			<h2>
				<b>校园论坛</b>
			</h2>
		</div>
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9">
				<c:forEach var="category" items="${categories}">
					<div class="col-xs-6 col-sm-6 col-md-6 placeholder">
						<div class="thumbnail">
							<img
								src="/VRweb/resources/image/shoolLogo/${category.logo_img}.png" />
							<div class="caption">
								<h3 class="text-center">
									<a href="/VRweb/category/${category.id}"><b>${category.name}</b></a>
								</h3>
								<p class="text-center text-muted">${category.AC}人浏览过该板块</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
				role="navigation">
				<div class="list-group">
					<a href="#" class="list-group-item active">城市列表</a>
					<c:forEach var="city" items="${allCity}">
						<a href="/VRweb/category/city/${city.city_id}"
							class="list-group-item">${city.city_name}</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>