<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学院负责</title>
</head>
<body>
	
	<form action="admin_addDepartment" method="post">
		<input type="text" name="department.de_name" placeholder="学院名称" required="required">
		<input type="text" name="department.de_descr" placeholder="学院描述" required="required">
		<select name="department.de_depM.depM_id">
			<c:forEach items="${depManagers}" var="depManager">
				<option value="${depManager.depM_id}">${depManager.depM_name }</option>			
			</c:forEach>
		</select>
		<input type="submit">
	</form>
</body>
</html>