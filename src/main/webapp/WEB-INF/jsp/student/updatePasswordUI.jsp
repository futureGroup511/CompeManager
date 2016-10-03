<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码页面</title>
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
	<form id="form" action="student_updatePassword">
		<s:hidden name="stu_id"></s:hidden>
		<div class="one">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>请输入密码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="password" class="form-control" id="password1" name="stu_password"> 
	            </div>
	            
	        </div>
	    </div>
	    <div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>请再次输入密码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3"><input class="form-control" type="password" id="password2" name="stu_password2"></div>
	           
	        </div>
	    </div>
	     <div class="last">
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
    
	function checkout(){
		var a = $("#password1").val();
		var b = $("#password2").val();
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