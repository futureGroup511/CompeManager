<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学院负责人修改密码页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/xueyuan3.css" />
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>

<body>
<div class="dangqian">

</div>
<div class="container">
	<form id="form" action="depManager_updatePassword">
		<input type="hidden" name="id" value="${sessionScope.depManager.depM_id }">
		<div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>请输入原始密码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="password" class="form-control" id="psword" onblur="verify(${sessionScope.depManager.depM_id })"> 
	            </div>
	            <div class="col-lg-2 col-md-3 col-xs-3">
	            	<p id="mess1" style="color:red;display:none">原始密码不正确！</p>
	            </div>
	        </div>
	    </div>
	    
		<div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>请输入密码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="password" class="form-control" id="password1" name="password" onblur="mess2()"> 
	            </div>
	            <div class="col-lg-2 col-md-3 col-xs-3">
	            	<p id="mess2" style="color:red;display:none">密码不能为空！</p>
	            </div>
	        </div>
	    </div>
	    
	    <div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>请再次输入密码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3"><input class="form-control" type="password" id="password2" onblur="mess3()"></div>
	        <div class="col-lg-2 col-md-1 col-xs-1">
	         	<p id="mess3" style="color:red;display:none">密码不能为空！</p>
	         	<p id="mess4" style="color:red;display:none">两次输入密码不同！</p>
	        </div>
	        </div>
	    </div>
	    
	    <div class="col-lg-2" style="margin-top:10px;margin-left:24%;width:30px;">
	     	<input type="button" id="button" class="btn btn-default  active" value="提交">
	    </div>
     </form>
</div>
<script type="text/javascript">

	$(document).ready(function(){
	    $("#button").click(function(){  
	        if(checkout()==true){  
	            $("#form").submit();  
	        }  
	    });  
	});
	
	function verify(id){
		var password = $("#psword").val(); 
		var password = $("#psword").val();
		var date = {
				"id":id,
				"password" : password
		}
		
		$.ajax({
			//先走校验的action
			url : 'depManager_isOrNopassword',
			type : 'post',
			data : date,
			dataType : 'text',
			success : function(date) {
				if(date == "false"){
					$("#button").attr("disabled","true");
					$("#mess1").show();
				} else{
					$("#button").removeAttr("disabled");
					$("#mess1").hide();
				}
			}

		});
		
	}
    
	function checkout(){
		var a = $("#password1").val();
		var b = $("#password2").val();
		var c = $("#psword").val();
		if(c==null | c ==''){
			alert("请输入原始密码！");
			return false;
		}
		
		if(a==null | a ==''){
			alert("请输入密码！");
			return false;
		}
		if(b ==null | b == ''){
			alert("请再次输入密码！");
			return false;
		}
		if(a != b){
			alert("两次输入密码不相同，请再次输入！");
			return false;
		} else {
			return true;
		}
		
	}
	
	function mess2(){
		if($("#password1").val()==''){
			$("#mess2").show();
		} else{
			$("#mess2").hide();
		}
	}
	
	function mess3(){
		if($("#password2").val()==''){
			$("#mess3").show();
		} else{
			$("#mess3").hide();
		}
		
		if($("#password1").val() != $("#password2").val()){
			$("#mess4").show();
		} else{
			$("#mess4").hide();
		}
	}
</script>
</body>
</html>







<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
</head>
<body>
<form id="form" action="student_updatePassword">
	<s:hidden name="stu_id"></s:hidden>
	请输入密码：<input type="password" id="password1" name="stu_password">
	请再次输入密码：<input type="password" id="password2" name="stu_password2">
	<input type="button" id="button" value="提交">
</form>
</body>
<script type="text/javascript">

	$(document).ready(function(){  
	    $("#button").click(function(){  
	        if(checkout()==true){  
	            $("#form").submit();  
	        }  
	    });  
	});
    
	function checkout(){
		var a = $("#password1").val();
		var b = $("#password2").val();
		if(a != b){
			alert("两次输入密码不相同，请再次输入！");
			return false;
		} else {
			return true;
		}
		
	}
</script>
</html> --%>