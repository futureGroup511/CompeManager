<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加获奖标准</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/jietu10.css" />
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>添加奖励标准</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-3 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>


		
		
		
		
	
<form action="admin_addAwardStand" method="post">	
	<div class="container">
	    <div class="row">
	        <div class="col-lg-3 col-lg-offset-1 col-md-3 col-md-offset-1 col-xs-3 col-xs-offset-1">
	        	<input type="text" class="form-control" name="awardStandard.award_type" placeholder="奖励类型">
	        </div>
	        <div class="col-lg-3  col-md-3 col-xs-3  ">
	        	<input type="text" class="form-control" name="awardStandard.award_teaMoney" placeholder="老师奖金">
	        </div>
	        <div class="col-lg-3  col-md-3   col-xs-3  ">
	        	<input type="text" class="form-control" name="awardStandard.award_stuMoney" placeholder="学生奖金">
	        </div>
	        <div class="col-lg-1 col-md-1 col-xs-2">
	        	<input class="btn btn-default  active" type="submit">
	        </div>
	</div>
	</div>
</form>
</body>
</html>



<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加获奖标准</title>
</head>
<body>
	<form action="admin_addAwardStand" method="post">
		<input type="text" name="awardStandard.award_type" placeholder="奖励类型">
		<input type="text" name="awardStandard.award_teaMoney" placeholder="老师奖金">
		<input type="text" name="awardStandard.award_stuMoney" placeholder="学生奖金">
		<input type="submit">
	</form>
</body>
</html> --%>