<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改奖励标准页面</title>
</head>
<body>
	<form action="awardstand_modify" method="post">
		<input type="hidden" name="award_id" value="${awardstand.award_id}">		
	竞赛类型:<input name="award_type" value="${awardstand.award_type}">
	学生获奖金额：<input name="award_stuMoney" value="${awardstand.award_stuMoney}">
	老师获奖金额: <input name="award_teaMoney" value="${awardstand.award_teaMoney}">
	获奖奖励等级：<input  value="${awardstand.award_awardHierarchy.awardHie_name}" readonly="readonly">
			     <input type="hidden" name="award_awardHierarchy.awardHie_id" value="${awardstand.award_awardHierarchy.awardHie_id}"> 
				 <input type="submit">
	</form>
</body>
</html>