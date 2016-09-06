<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xue1.css">

<title>发送通知页面</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor/ckeditor.js"></script>

</head>
<body>
	<div class="dangqian">
	  <div class="row">
	        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
	            <p>当前位置：学院负责人>>发布通知</p>
	        </div>
	        <div class="col-lg-2 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
	            <p>欢迎 	${sessionScope.depManager.depM_name }  登录本系统</p>
	        </div>
	  </div>
	</div>
	
	<form action="depManager_sendInform" method="post" id="form" class="form-horizontal">
	
		 <div class="form-group">
		    <label for="inputEmail3" class="col-lg-2 col-md-2 col-xs-3 control-label">标题</label>
		    <div class="col-lg-2 col-md-2 col-xs-3">
		      <input type="text" class="form-control" name="notification.noti_title" id="inputEmail3" placeholder="">
		    </div>
		    <div class="col-lg-9">
		    </div>
  		</div>
  		
  		<div class="row">
		　 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-xs-8 col-xs-offset-2">
		     <textarea rows="11" class="ckeditor" name="notification.noti_content" id="myEditor" style="width:400px; height:200px" ></textarea>  
		   </div>
		   <div class="col-lg-1">
		   </div>
		</div>
  		
		<div class="container">
		  <div class="row">
		   <div class="col-lg-2 col-lg-offset-9 col-md-2 col-md-offset-9 col-xs-3 col-xs-offset-9">
		      <button class="btn btn-primary">提交</button>
		   </div>
		  </div>
	  </div>
	</form>
	
	
	
	
 
</body>

    
</html>