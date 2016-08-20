<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆界面</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="modal show">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close"><span>&times;</span></button>
					<h1 class="text-center text-primary">登陆</h1>
				</div>		
				<div class="modal-body">
					<form action="student_login" class="form col-md-12 center-block" method="post">
						<div class="form-group">
							<input  type="text" class="form-control input-lg" name="stu_num" placeholder="账号" required="required">
						</div>
						<div class="form-group">
							<input type="password" class="form-control input-lg" name="stu_password" placeholder="密码">
						</div>
						<button class="btn btn-primary btn-lg btn-block">立即登陆</button>
						<span><a href="#">找回密码</a></span>
						<span><a href="student_addStudentView" class="pull-right">立即注册</a></span>
					</form>
				</div>
				<div class="modal-footer">
				
				</div>
			</div>
		</div>
	</div>
	
</body>
</html> --%>