<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
.a {
	width: 500px;
	height: 300px;
}
</style>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/head.jsp"%>

		<div class="page-header">
			<h2></h2>
		</div>

		<div class="media">
			<div class="media-left">
				<a href="#"> <img class="media-object"
					src="/VRweb/resources/image/shoolLogo/${category.logo_img}.png"
					alt="...">
				</a>
			</div>
			<div class="media-body">
				<img src="/VRweb/resources/image/i_h2.png">
				<h3 class="media-heading">
					<b>${category.name}</b>
				</h3>
				<table class="table table-striped">
					<tr>
						<td>创办时间</td>
						<td>${category.startTime}</td>
					</tr>
					<tr>
						<td>学校性质</td>
						<td>${category.nature}</td>
					</tr>
					<tr>
						<td>地址</td>
						<td>${category.address}</td>
					</tr>
					<tr>
						<td>电话</td>
						<td>${category.tel}</td>
					</tr>
				</table>
			</div>
			<div class="media-right">
				<img class="a img-thumbnail"
					src="/VRweb/resources/image/skdslider/${category.logo_img}.jpg">
			</div>
			<div class="media">
				<div class="media-body">
					<h4 class="media-heading">
						<b>学校简介</b>
					</h4>
					${category.cate_detail}
					<p class="pull-right">友情链接:&nbsp;<a class="text-primary" href="${category.webAddress}">${category.name}官网</a></p>
				</div>
				<hr class="hidden-xs" />
				<a type="button" class="btn btn-blue" href="/VRweb/scenic/${category.id}">浏览全景</a>
				<a type="button" class="btn btn-green" href="/VRweb/category/${category.id}">校园论坛</a>
			</div>
		</div>
	</div>
	<!-- end 底部 -->

</body>
</html>