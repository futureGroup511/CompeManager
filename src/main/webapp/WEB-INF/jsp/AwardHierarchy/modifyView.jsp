<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改页面</title>
</head>
<body>
	<form action="awardhierar_modify" method="post">
		<input type="hidden" name="awardHie_id" value="${awardh.awardHie_id}">
		<input type="hidden" name="awardHie_standard.award_id" value="${awardh.awardHie_standard.award_id}">
	奖励等级名称：<input type="text" name="awardHie_name" value="${awardh.awardHie_name}">
	奖励等级描述: <input type="text" name="awardHie_descr" value="${awardh.awardHie_descr}">
		<input type="submit">
	</form>
</body>
</html>