<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加竞赛等级</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jietu15.css">
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>添加竞赛等级</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>


		
		

<form action="admin_addCompetitionHierarchy" method="post">
	<div class="container">
		<div class="one">
	    	<div class="row">
	            <div class="col-lg-3  col-lg-offset-1 col-md-3 col-xs-3">
	            	<input type="text" class="form-control" name="comhi.compeHie_name" placeholder="竞赛等级名称" required="required">
	            </div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text" class="form-control" name="comhi.compeHie_descr" placeholder="竞赛等级描述" required="required">
	            </div>
	            <div class="col-lg-2  col-md-4  col-xs-4 ">
	                <input type="submit" class="btn btn-primary" value="提交">
	            </div>
	        </div>
	    </div>
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
<title>添加竞赛等级</title>
</head>
<body>
	<form action="admin_addCompetitionHierarchy" method="post">
		<input type="text" name="comhi.compeHie_name" placeholder="竞赛等级名称" required="required">
		<input type="text" name="comhi.compeHie_descr" placeholder="竞赛等级描述" required="required">
		<input type="submit">
	</form>
	
</body>
</html> --%>