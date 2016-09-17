<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大学生竞赛管理系统</title>
  
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
						<form action="loginControll_login" method="post" class="form col-md-12 center-block" >
							<div class="form-group">
								<input type="text" class="form-control input-lg" name="number" placeholder="账号" required="required">
							</div>
							<div class="form-group">
								<input type="password" class="form-control input-lg" name="password" placeholder="密码" required="required">
							</div>
							<div class="from-group col-md-12">
								<select name="role">
									<option value="学生">学生</option>
									<option value="学院负责人">学院负责人</option>
									<option value="教务处">教务处</option>
								</select>
							</div>
							<div class="from group">
								<input  type="checkbox" name="useCookie" value="true" >自动登陆
							</div>
							<p class="text-center text-danger" id="prompt">账号密码错误</p>
							<button type="button" class="btn btn-primary btn-lg btn-block" onclick="login();">立即登陆</button>
							
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
<script type="text/javascript">
	$(function(){
			
		$("#prompt").hide();
		
		
	});
	
	
	
	
	function login(){
        var num=$("input[name='number']").val(); 
		var password=$("input[name='password']").val();
		var role=$("select").get(0).value;
		var datas={
				number:num,
				password:password,
				role:role,
		}
		$.ajax({
			url:"loginControll_juge",
			type:"post",
			data:datas,
			dataType:'json',
			success:function(msg){
				if(msg==="erro"){
					$("#prompt").show();
				}else if(msg==="correct"){
					$("#prompt").hide();
					$($("form").get(0)).submit();
				}
			}
		});
	}
</script>
</html>