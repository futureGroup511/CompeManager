<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加获奖等级</title>
</head>
<body>
 	<form action="admin_addAwardHierarchy" method="post">
 		<input type="text" name="awardhi.awardHie_name" placeholder="获奖等级名称">
 		<input type="text" name="awardhi.awardHie_descr" placeholder="获奖等级描述">
 		获奖标准:
 		<select name="awardhi.awardHie_standard.award_id">
 			<c:forEach items="${awardStandards}" var="awardstand">
 				<option value="${awardstand.award_id}">${awardstand.award_type}</option>
 			</c:forEach>
 		</select>
 		<input type="submit">
 	</form>
</body>
</html>