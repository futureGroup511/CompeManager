<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>æ æ é¢ææ¡£</title>
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<style>
	*{
		margin:0;
		padding:0;
	}
	body{
		width:1140px;
		height:550px;
	}
	.container{
		width:100%;
		height:100%;
		margin:0 auto;
	}
	.article{
		margin:300px auto;
		width:400px;
		height:300px;
		font-size:35px;
		color:#cccccc;
		text-align:center;
	}
</style>
</head>

<body style="background-image:url(<%=basePath %>images/background.jpg);">
<div class="container">
	<div class="article">
		申请成功<br/>待审核
	</div>
</div>
</body>
</html>
