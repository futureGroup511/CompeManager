<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<title>修改报名表</title>
</head>
<body>
	<form action="depManager_modifySignUp">
				  <input type="hidden" value="${signUp.signUp_id}" name="signup.signUp_id">
		 报名时间:<input id="date" type="date" name="signup.signUP_time" value="${fn:substring(signUp.signUP_time,0,10)}">
		 指导老师:<input type="text" name="signup.signUp_teacher" value="${signUp.signUp_teacher}">
		 竞赛类型：
		 <s:if test="#request.signUp.singnup_type==1">
		 	<input type="radio" name="signup.singnup_type" value="1" checked="checked" onclick="return false">团队
		 	<input type="radio" name="signup.singnup_type" value="2" onclick="return false">个人
		 </s:if> 
		 <s:if test="#request.signUp.singnup_type==2">
		 	<input type="radio" name="signup.singnup_type" value="1" onclick="return false">团队
		 	<input type="radio" name="signup.singnup_type" value="2" checked="checked" onclick="return false">个人
		 </s:if>
		 <s:if test="#request.signUp.singnup_type==1">
		 	团队名称:<input type="text" name="signup.signUp_team" value="${signUp.signUp_team}">
		 </s:if> 
		 <input type="submit">
	</form>
</body>
 <script type="text/javascript">
	
</script> 
</html>