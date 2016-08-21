<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加竞赛等级</title>
</head>
<body>
	<form action="admin_addCompetitionHierarchy" method="post">
		<input type="text" name="comhi.compeHie_name" placeholder="竞赛等级名称" required="required">
		<input type="text" name="comhi.compeHie_descr" placeholder="竞赛等级描述" required="required">
		<input type="submit">
	</form>
	
</body>
</html>