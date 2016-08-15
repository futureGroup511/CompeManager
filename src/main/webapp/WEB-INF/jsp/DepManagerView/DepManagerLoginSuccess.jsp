<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学院负责人</title>
</head>
<body>
	<ul>
		<li><a href="depManager_applyCompeName">申报项目名称</a></li>
		<li><a href="depManager_seeAllApplyCompNames">查看申报项目名称审核状态</a></li>
		<li><a href="depManager_applyCompetitionPage">申报项目</a></li>
		<li><a href="depManager_seeAllApplyCompetition">查看申报项目审核状态</a></li>
		<!-- <li><a href="depManager_seeHistoryCompetition">历史申报项目</a></li> -->
		<li><a href="depManager_inspectStudentApplyPage">审核报名</a></li>
	</ul>
</body>
</html>