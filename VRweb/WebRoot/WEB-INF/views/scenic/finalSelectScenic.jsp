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
							<c:forEach var="scenic" items="${scenicList}">
					<div class="col-xs-6 col-sm-6 col-md-6" >
							<div class="thumbnail">
								<img data-src="holder.js/300x300"
									src="/VRweb/resources/panoraman/${scenic.scenic_id}/thumbnail.jpg">
								<div class="caption">
									<h3>
										<b>${scenic.scenic_name}</b>
									</h3>
									<p class="text-muted">${scenic.scenic_detail}</p>
										<a role="button" class="btn btn-blue"
											href="/VRweb/scenic/${scenic.scenic_id}">浏览全景</a>
									    <label class="text-right text-warning">访问量：${scenic.AC}</label>
								</div>
							</div>
					</div>
				</c:forEach>
		</div>
	</div>

</body>
</html>