
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<s:submit value="提交"></s:submit>
	</s:form>
	<a href="student_loginView.action">学生登陆</a>
	<a href="admin_loginView.action">教务处</a>
	
</body>
</html>



