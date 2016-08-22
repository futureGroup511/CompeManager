<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>发送通知页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>

</head>
<body>
	<div style="width:800px;">
	<form action="depManager_sendInform" method="post" id="form">
		<label>标题</label>
		<input type="text" name="notification.noti_title">
		<textarea class="ckeditor" name="notification.noti_content" id="myEditor" style="width:400px; height:200px">这里写你的初始化内容</textarea>  
		<button onclick="">提交</button>
	</form>
	
	</div>
	
	
 
</body>

    
</html>