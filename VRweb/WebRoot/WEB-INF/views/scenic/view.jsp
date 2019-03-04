<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
.row {
	margin-top: 30px;
}
</style>
</head>
<body>
	<div class="container" id="scenicDiv">
		<%@include file="/WEB-INF/views/head.jsp"%>
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-xs-12 col-sm-9">
				<c:forEach var="scenic" items="${scenicList}">
					<div class="col-xs-6 col-sm-6 col-md-6 placeholder" >
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
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar"
				role="navigation">
				<div class="list-group">
					<a href="#" class="list-group-item active">城市列表</a>
					<c:forEach var="city" items="${allCity}">
						<a href="/VRweb/scenic/city/${city.city_id}"
							class="list-group-item">${city.city_name}</a>
					</c:forEach>
				</div>
			</div>
			<!--/.sidebar-offcanvas-->
		</div>
	</div>
	<!-- end 底部 -->
	<div id="navigation" align="center">
		<a href="/VRweb/scenic/allScenic?page=2"></a>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#scenicDiv").infinitescroll({
				navSelector : "#navigation",
				nextSelector : "#navigation a",
				itemSelector : ".row row-offcanvas row-offcanvas-right .col-xs-6 col-sm-6 col-md-6 placeholder",
				animate : true
			//加载时候时候需要动画，默认是false 
			});
		});
	</script>
</body>
</html>