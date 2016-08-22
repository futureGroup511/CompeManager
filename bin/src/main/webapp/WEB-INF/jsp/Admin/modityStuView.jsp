<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生页面</title>
</head>
<body>


	<form action="admin_modifyStu" method="post">
			<input hidden type="text" name="stu.stu_id" value="${stu.stu_id }">
			<input hidden type="text" name="stu.stu_department.de_id" value="${stu.stu_department.de_id}">
			<input hidden type="text" name="stu.stu_sex" value="${stu.stu_sex }">
		姓名:<input  type="text" name="stu.stu_name" value="${stu.stu_name }">
		账号:<input  type="text" name="stu.stu_num" value="${stu.stu_num }" readonly="readonly">
		密码:<input  type="text" name="stu.stu_password" value="${stu.stu_password }" >
		班级:<input  type="text" name="stu.stu_class" value="${stu.stu_class }" >
		院系:<input  type="text" readonly ="readonly"  value="${stu.stu_department.de_name }" >
			<input type="submit">
	</form>
	

</body>
</html>