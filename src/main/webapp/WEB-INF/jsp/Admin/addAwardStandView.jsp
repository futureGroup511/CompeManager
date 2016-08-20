<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加获奖标准</title>
</head>
<body>
	<form action="admin_addAwardStand" method="post">
		<input type="text" name="awardStandard.award_type" placeholder="奖励类型">
		<input type="text" name="awardStandard.award_teaMoney" placeholder="老师奖金">
		<input type="text" name="awardStandard.award_stuMoney" placeholder="学生奖金">
		<input type="submit">
	</form>
</body>
</html>