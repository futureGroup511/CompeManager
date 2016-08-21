<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改竞赛等级</title>
</head>
<body>

	<form action="comphier_modify" method="post">"
		<input type="hidden" name="compeHie_id" value="${comph.compeHie_id }">
	名称：<input type="text" name="compeHie_name" value="${comph.compeHie_name }">
	描述：<input type="text" name="compeHie_descr" value="${comph.compeHie_descr }">
		 <input type="submit">
	</form>
</body>
</html>