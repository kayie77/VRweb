<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>全景列表</title>
<script src="/VRweb/resources/js/jquery.min.js"></script>
<script src="/VRweb/resources/js/bootstrap.min.js"></script>
<link href="/VRweb/resources/css/bootstrap.css" rel="stylesheet">

</head>

<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="javascript:window.history.go(-1)"><span
					class="glyphicon glyphicon-chevron-left"></span><b>返回</b></a>
			</div>
		</div>
	</nav>

	<!--全景窗口-->
	<div id="360VR" style="padding-top:51px;">
		<iframe width="100%" height="100%" frameborder="0" scrolling="no" src="/VRweb/resources/panoraman/${scenic.scenic_id}/index.html"></iframe>
	</div>
	<!--全景窗口 end-->
	<script>
		$(document).ready(function() {
			resizeControls();
		});
		$(window).resize(function() {
			resizeControls();
		});
		//设置高度为窗口可见高度
		function resizeControls() {
			$("#360VR").css("height", $(window).height());
		}
	</script>
</body>
</html>
