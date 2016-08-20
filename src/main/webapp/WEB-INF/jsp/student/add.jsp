<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生界面</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="modal show ">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close"><span>&times;</span></button>
					<h1 class="text-center text-primary">添加学生</h1>
				</div>
				<div class="modal-body">
						<form action="student_addStudent" class="form col-md-12 center-block" method="POST">
							<div class="form-group">
								<input type="text" class="form-control input-lg" placeholder="账号" name="stu_num">
							</div>
							
							<div class="form-group">
								<input type="password" class="form-control input-lg" placeholder="密码" name="stu_password">
							</div>
							<div class="form-group">
								<input type="text" class="form-control input-lg" placeholder="姓名" name="stu_name">
							</div>
							<div class="form-group">
								<input type="text" class="form-control input-lg" placeholder="班级" name="stu_class">
							</div>
							<div>
								性别:<input type="radio"  name="stu_sex" value="男" required="required">男
									 <input type="radio"  name="stu_sex" value="女" required="required">女
							         <input type="radio"  name="stu_sex" value="其他" required="required">其他
							</div>
							<div class="form-group">
								<select name="stu_department.de_id">
									<c:forEach items="${departments}" var="department">
	     								<option value="${department.de_id}">${department.de_name }</option>
	     							</c:forEach>
								</select>
							</div>
							
							<button class="btn btn-primary btn-lg btn-block">确认添加</button>
						
						</form>
				</div>
				<div class="modal-footer">
				
				</div>
			</div>
		</div>
	</div>

</body>
</html>