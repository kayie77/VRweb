<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-cn">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=10" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>360°校园全景网</title>
<link rel="shortcut icon" type="/VRweb/resources/image/x-icon"
	href="image/favicon(1).ico">
<link href="/VRweb/resources/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
	color: #606159;
}
</style>
</head>
<body class="start">

	<!-- 导航栏 -->
	<div id="header" class="navbar-wrapper" role="banner">
		<div class="navbar navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target=".navbar-collapse">
						<span>Menu</span>
					</button>
					<a class="navbar-brand" href="/VRweb/index"
						title="Blend Interactive"><img
						src="/VRweb/resources/image/logo1.png" /></a>
				</div>
				<div class="navbar-collapse collapse">
					<form class="navbar-form navbar-left" role="search"
						action="/VRweb/search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="搜索学校.."
								name="keyword">
						</div>
						<button type="submit" class="btn btn-default">提交</button>
					</form>
					<ul class="nav navbar-nav blend-nav">
						<li class=active><a href="/VRweb/index"><b>首页</b></a></li>
						<li><a href="/VRweb/scenic/allScenic"><b>全景</b></a></li>
						<li><a href="/VRweb/bbs/index"><b>论坛</b></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- end 导航栏 -->

	<script src="/VRweb/resources/js/blend.js"></script>
	<script src="/VRweb/resources/js/analytics.js"></script>
	<script src="/VRweb/resources/js/389452.js"></script>

	<!-- Start of Async HubSpot Analytics Code -->
	<script type="text/javascript">
		(function(d, s, i, r) {
			if (d.getElementById(i)) {
				return;
			}
			var n = d.createElement(s), e = d.getElementsByTagName(s)[0];
			n.id = i;
			n.src = '//js.hs-analytics.net/analytics/'
					+ (Math.ceil(new Date() / r) * r) + '/389452.js';
			e.parentNode.insertBefore(n, e);
		})(document, "script", "hs-analytics", 300000);
	</script>
	<!-- End of Async HubSpot Analytics Code -->
</body>
</html>