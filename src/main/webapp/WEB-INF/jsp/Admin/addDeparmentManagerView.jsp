<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学院负责人页面</title>
</head>
<body>
	<form action="admin_addDepartmentManager" method="post">
	姓名:<input type="text"  name="dm.depM_name" value="" required="required">
	工号:<input type="text"  name="dm.depM_num" value="" required="required">
	密码:<input type="password"  name="dm.depM_password" value="" required="required">
	性别:<input type="radio"  name="dm.depM_sex" value="男" required="required">男
		 <input type="radio"  name="dm.depM_sex" value="女" required="required">女
         <input type="radio"  name="dm.depM_sex" value="其他" required="required">其他
	电话号码:<input type="text"  name="dm.depM_phoneNum" value="" required="required">
	负责院系:
		<select name="dm.depM_department.de_id" required="required">
			<c:forEach items="${departments}" var="department">
	     		<option value="${department.de_id}">${department.de_name }</option>
	     	</c:forEach>	
		</select>
		<input type="submit">
	</form>
</body>
</html>