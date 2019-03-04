<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page contentType="text/html;charset=gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"  %>

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
		<%@ include file="/WEB-INF/views/bbs/head.jsp"%>
	</div>
	<div class="aw-container-wrap">
		<div class="aw-container aw-wecenter aw-user">
			<div class="aw-user-setting">
				<div class="tabbable">
					<ul class="nav nav-tabs aw-reset-nav-tabs">

						<li class="active"><a
							href="#">基本资料</a>
						</li>

						<h2>用户设置</h2>
					</ul>
				</div>

				<div class="tab-content clearfix">
					<!-- 基本信息 -->
					<div class="aw-mod">
						<div class="aw-mod-head"></div>
						
						<sf:form method="post" id="user_info" modelAttribute="user">				
							<div
								class="aw-mod-body aw-user-setting-layout aw-user-setting-base">
								<dl>
									<dt>账户名:</dt>
									<dd>${currUser.username}</dd>
								</dl>
								<dl>
									<dt>性别:</dt>
									<dd>
										 <label>
                        				    <sf:radiobutton  path="sex" name="sex" value="男"/> 男
				                        </label>
				                        &nbsp;
				                        <label>
				                            <sf:radiobutton path="sex" name="sex" value="女"/>女
				                        </label>
									</dd>
								</dl>
								<dl>
									<dt>
										<label>一句话介绍:</label>
									</dt>
									<dd class="aw-user-setting-base-introduce">
										<input class="form-control" name="oneWord" maxlength="128"
											type="text" value="${currUser.oneWord}" />
									</dd>
								</dl>

								<dl>
									<dt>
										<label>自我介绍:</label>
									</dt>
									<dd class="aw-user-setting-base-introduce">
										<input class="form-control" name="personalDescribe" maxlength="128"
											type="text" value="${currUser.personalDescribe}" />
									</dd>
								</dl>

							</div>
					<!-- end 基本信息 -->

						<a href="javascript:;"
							class="btn btn-large btn-success pull-right aw-user-setting-save" id="message_submit"
							onclick="$(user_info).submit();">保存</a>			
				    </sf:form>
				    
					<script type="text/javascript"
						src="http://as.landonni.com/static/js/app/setting.js"></script>

				</div>
			</div>
		</div>
	</div>
	<div class="aw-footer-wrap">
	    <div class="aw-footer aw-wecenter">
	        Copyright  2015 - 全景校园BBS , All Rights Reserved
	</div>
	</div>

</body>
</html>