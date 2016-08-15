<%@ taglib prefix="s" uri="/struts-tags" %>
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
<title>test</title>
</head>
<body>
	<s:form method="post" action="depManager_login">
		<s:textfield name="depM_num"/>
		<s:textfield name="depM_password"/>
		<s:submit value="我是学院负责人登陆"></s:submit>
	</s:form>
	<s:actionerror/>
	<a href="student_login">学生登陆</a>
</body>
</html>



