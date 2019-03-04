<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<link href="/VRweb/resources/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
</style>
</head>

<body class="start">
	<!-- 导航栏 -->
	<%@include file="/WEB-INF/views/head.jsp"%>
	<!--end 导航栏 -->
	<!-- 图片轮播 -->
	<div id="blend-slider" class="skdslider">
		<ul>
			<c:forEach var="shool" items="${scenicList}">
				<li class="block contentareaitem col-md-3"><img
					src="/VRweb/resources/image/skdslider/${shool.category.logo_img}.jpg" />

					<div class="slide-container">
						<div class="container">
							<div class="slide-desc">
								<h2>${shool.scenic_name}</h2>
								<p>
									<span>Campus Panorama</span><a class="btn btn-green"
										href="/VRweb/scenic/allScenic" role="button">进入全景</a>
								</p>
							</div>
						</div>
					</div></li>
			</c:forEach>
		</ul>
		<a class="prev"></a> <a class="next"></a>
	</div>
	<!-- end 图片轮播 -->

	<!-- 全景简介 -->
	<div id="Callout">
		<div class="container">
			<div class="border">
				<p>
					<b>
						360度校园全景网是为广西高校打造的校园环境资源综合展示平台，用户通过本网站的全景展示系统可以浏览感兴趣学校的全景，包括校园环境，住宿环境，教学设施等，让学生家长通过网络就可身临其境的感受到校园风光。用户还可以使用论坛与感兴趣高校的学长学姐，老师领导们交流互动，进一步了解该校的信息。</b>
				</p>
				<button type="button" class="btn btn-green btn-lg" data-toggle="modal" data-target="#myModal">详细介绍</button>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel"><b>系统开发背景</b></h4>
							</div>
							<div class="modal-body">&nbsp;&nbsp;随着计算机技术的高速发展，多媒体包含的种类越来越多，所能表现的效果也越来越多，而网站也正在成为各种企业，事业单位，学校展示形象、发布信息，扩大知名度的重要渠道。如今，网站的互动性越来越为大家所强调，比较传统的表现方式已经不能被广大用户所接受。在基于B/S架构的网站中比较传统的展示手法一般就是平面图片、文本、音频、动态视频等，但这些表现手段都存在给自的缺点。基于图像的360全景虚拟现实技术能真实、全面的表现某一场景，将会给校园的宣传、展示提供全新的表现形式。
								360全景的效果处在平面媒体和三维建模之间，不仅有强烈的真实感，更有立体感和沉浸感，而这样的一个效果制作起来并不麻烦，一个全景场景从拍摄到全景合成并生成漫游只需要短短的几分钟时间。目前，360度全景行业的应用领域一般有多媒体广告、房产展示、旅游风光、政府部门，教育科研等。基于图像的360全景技术如果应用于校容校貌展示，就可以让学生在选择自己理想学校时仅需通过网络，就能身临其境的感受美丽的校园风光、良好的教学环境。而校方则能更真实形象的展示学校的建设环境，吸收生源，扩大知名度。将360全景与数字校园结合是现阶段实现数字校园比较简单与现实的方法。
								据目前了解，中国绝大多数高校的校园网站都还未拥有虚拟校园这个模块，只有少数的比较知名的大学率先拥有，如浙江大学、上海交通大学等。本系统致力于搭建一个综合的校园全景展示网站，用户就可快速搜索到自己理想学校的校园全景，不必花太多精力在搜索上面。网站如果结合了互动论坛模块，便能弥补用户只能通过浏览校园全景了解校园而不能进一步获取更多关于该校实时信息的缺陷。</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- end 全景简介 -->

	<!-- 校园全景 -->
	<div class="container">
		<div class="page-header">
			<h1>
				<b>热门全景</b><small><a href="/VRweb/scenic/allScenic"
					title="查看更多">更多高校全景 ></a></small>
			</h1>
		</div>

		<div class="row">
			<c:forEach var="scenic" items="${scenicList}">
				<div class="col-xs-4 col-md-4 col-sm-4 ">
					<div class="thumbnail">
						<img
							src="/VRweb/resources/panoraman/${scenic.scenic_id}/thumbnail.jpg"
							alt="">
						<div class="caption">
							<h3>
								<b>${scenic.scenic_name}</b>
							</h3>
							<p class="text-muted">${scenic.scenic_detail}</p>
							<p>
								<a role="button" class="btn btn-blue"
									href="/VRweb/scenic/${scenic.scenic_id}">浏览全景</a> <label
									class="text-right text-warning">访问量：${scenic.AC}</label>
							</p>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>


		<!--end 校园全景 -->

		<!-- 学校简介 -->

		<div class="page-header">
			<h1>
				<b>学校简介</b> <small class="text-right"><a
					href="/VRweb/Shool/allShool" title="查看更多">更多高校详情 ></a></small>
			</h1>
		</div>
	</div>

	<div id="main-content">

		<div class="container">
			<div class="row home-blocks">
				<c:forEach var="category" items="${allCategory}">

					<div class="block contentareaitem half col-md-6">
						<div class="media">
							<img
								src="/VRweb/resources/image/shoolLogo/${category.logo_img}.png" />
							<div class="media-body">
								<h4 class="media-heading">
									<a href="/VRweb/Shool/index/${category.id}?"><b>${category.name}</b></a>
								</h4>
								${category.cateDescribe}
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- end 学校简介 -->

	<!-- 底部 -->
	<div id="footer">
		<hr class="hidden-xs" />
		<div class="container">
			<div class="footer">
				<table class="table">
					<tr>
						<td>友情链接</td>
						<c:forEach var="category" items="${allCategory}">
							<td><a href="${category.webAddress}">${category.name}官网</a></td>
						</c:forEach>
					</tr>
				</table>
				<p class="text-center">&copy; wjy 2015</p>
			</div>

		</div>
	</div>
</body>
</html>
