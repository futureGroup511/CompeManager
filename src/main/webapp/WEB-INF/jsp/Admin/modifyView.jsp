<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学院负责人页面</title>
</head>
<body>
	
	<form action="admin_modify" method="post">
			 <input type="text" hidden name="dm.depM_id"  value="${dem.depM_id }">
			 <input type="text" hidden name="dm.depM_sex"  value="${dem.depM_sex}">
			 <input type="text" hidden name="dm.depM_department.de_id"  value="${dem.depM_department.de_id }">
		账号:<input type="text" name="dm.depM_num" readonly="readonly" value="${dem.depM_num }">	
		密码:<input type="text" name="dm.depM_password" value="${dem.depM_password }">
		姓名:<input type="text" name="dm.depM_name" value="${dem.depM_name }">
		电话:<input type="text" name="dm.depM_phoneNum" value="${dem.depM_phoneNum }">
		<input type="submit">
	</form>
	
</body>
</html>