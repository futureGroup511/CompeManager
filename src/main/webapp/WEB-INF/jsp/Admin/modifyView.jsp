<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学院负责人页面</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/jietu12.css" />
</head>

<body>
<div class="add">
	<div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>修改学院负责人信息</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
    </div>
</div>


<form action="admin_modify" method="post">
<input type="text" hidden name="dm.depM_id"  value="${dem.depM_id }">
			 <input type="text" hidden name="dm.depM_sex"  value="${dem.depM_sex}">
			 <input type="text" hidden name="dm.depM_department.de_id"  value="${dem.depM_department.de_id }">
	<div class="container">
		<div class="one">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>姓名：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text" class="form-control" name="dm.depM_name" value="${dem.depM_name }">
	            </div>
	            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>电话号码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text" class="form-control" name="dm.depM_phoneNum" value="${dem.depM_phoneNum }">
	            </div>   
	        </div>
	    </div>
	    <div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>密码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text" class="form-control" name="dm.depM_password" value="${dem.depM_password }">
	            </div>
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>帐号：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text" class="form-control" name="dm.depM_num" readonly="readonly" value="${dem.depM_num }">
	            </div> 
	        </div>
	    </div>
	</div>
	<div class="last">
        	<input class="btn btn-default  active" type="submit" value="提交">
	 </div>
</form>
</body>
</html>











<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学院负责人页面</title>
</head>
<body>
	
	<form action="admin_modify" method="post">
			 <input type="text" hidden name="dm.depM_id"  value="${dem.depM_id }">
			 <input type="text" hidden name="dm.depM_sex"  value="${dem.depM_sex}">
			 <input type="text" hidden name="dm.depM_department.de_id"  value="${dem.depM_department.de_id }">
		账号:<input type="text" name="dm.depM_num" readonly="readonly" value="${dem.depM_num }">	
		密码:<input type="text" name="dm.depM_password" value="${dem.depM_password }">
		姓名:<input type="text" name="dm.depM_name" value="${dem.depM_name }">
		电话:<input type="text" name="dm.depM_phoneNum" value="${dem.depM_phoneNum }">
		<input type="submit">
	</form>
	
</body>
</html> --%>