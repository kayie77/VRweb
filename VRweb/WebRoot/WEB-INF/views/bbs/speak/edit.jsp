<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page contentType="text/html;charset=gbk"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"  %>
<html>
  <head>
    
    <title>My JSP 'edit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <sf:form method="post" modelAttribute="question">
	    <table>
	        <tr>
	            <td>问题:</td><td><sf:input path="title"/></td>
	        </tr>
	        <tr>
	            <td>描述:</td><td><sf:input path="content"/></td>
	        </tr>
	        <tr>
	            <td colspan="2"><input type="submit" value="提交"/></td>
	        </tr>
	    </table>
	</sf:form>
  </body>
</html>
