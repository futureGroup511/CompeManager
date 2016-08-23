<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学院</title>
</head>
<body>
	
	<form action="admin_modifyDepartsuccess" method="post">
		<input hidden type="text" name="department.de_id" value="${depart.de_id }">
		<input hidden type="text" name="department.de_depM.depM_id" value="${depart.de_depM.depM_id }">
	描述：<input  type="text" name="department.de_descr" value="${depart.de_descr }">
	名称: <input  type="text" name="department.de_name" value="${depart.de_name }">
	<input type="submit">
	</form>
	
</body>
</html>