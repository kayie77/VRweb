<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<style type="text/css">
.aa{padding-top:20px;}
</style>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/head.jsp"%>
		<div class="aa"></div>
		<div class="row">
				<c:forEach var="shool" items="${categoryList}">
					<div class="col-xs-6 col-sm-6 col-md-4" >
							<div class="thumbnail">
								<img src="/VRweb/resources/image/shoolLogo/${shool.logo_img}.png" />
								<div class="caption">
									<h3>
										<b>${shool.name}</b>
									</h3>
									<p class="text-muted">${shool.cateDescribe}</p>
										<a role="button" class="btn btn-blue"
											href="/VRweb/Shool/index/${shool.id}?">主页</a>
									    <label class="text-right text-warning">访问量：${shool.AC}</label>
								</div>
							</div>
					</div>
				</c:forEach>
		</div>
	</div>

</body>
</html>