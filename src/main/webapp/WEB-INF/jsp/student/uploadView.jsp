<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xuanze.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<title>上传附件页面</title>
<script type="text/javascript">
	$(function(){
			$("button[class='btn btn-info']").click(function(){
				if($.trim($("input[name='file']").val())==''){
					$("form").append("<p class='text text-danger'>未上传文件请重新选择</p>");
					return false;
				}
				
				var file = $("#file").val();
				var file1 =file.substr(file.length-3);
				if(file1 == "jpg" | file1 == "png" | file1=='JPG'){
					var size = document.getElementById('file').files[0].size;
					var size1 = size/(1024*1024);
					if(size1 < 2){
					} else{
						alert("文件大小大于2M！");
						return false;
					}
				}else {
					alert("请选择正确的文件！");
					return false;
				}
				
			});		
	})
	
	function check(){	
		var file = $("#file").val();
		var file1 =file.substr(file.length-3);
		if(file1 == "jpg" | file1 == "png" | file1=='JPG'){
			var size = document.getElementById('file').files[0].size;
			var size1 = size/(1024*1024);
			if(size1 < 2){
			} else{
				alert("文件大小大于2M！");
			}
		}else {
			alert("请选择正确的文件！");
		}
	}
	
</script>
</head>
<body>
<div class="container">
  <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：学生服务>>上传附件</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎${stu.stu_name}登录本系统</p>
        </div>
  </div>
</div>
	
<div class="row">
	<form action="student_uploadFile" method="post" enctype="multipart/form-data">
		<div class="form-group">
	     <div class="col-lg-2 col-lg-offset-4 col-md-2 scol-md-offset-4 col-xs-2  col-xs-offset-4">
	       <input type="file" onchange="check()" name="file" id="file">  
	     </div>
	      <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1">
	       <button class="btn btn-info" >上传</button>
	       <input hidden type="text" name="award_id" value="${award_id}">
	     </div>
	  </div>
	</form>
	 
</div>
	
	
</body>
</html>