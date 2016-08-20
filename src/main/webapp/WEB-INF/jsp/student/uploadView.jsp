<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传附件页面</title>
</head>
<body>
	<form action="student_uploadFile" method="post" enctype="multipart/form-data">
		<input type="file" name="file">  
		<button class="btn btn-info">上传</button>
		<input hidden type="text" name="award_id" value="${award_id}">
	</form>
</body>
</html>