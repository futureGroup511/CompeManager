<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改竞赛等级</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jietu16.css">
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>修改竞赛等级</p>
        </div>
        <div class="col-lg-2 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>

	

		 
	
<form action="comphier_modify" method="post">	
<input type="hidden" name="compeHie_id" value="${comph.compeHie_id }">
<div class="container">
	<div class="one">
    	<div class="row">
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>名称：</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<input type="text" class="form-control" name="compeHie_name" value="${comph.compeHie_name }"/>
            </div>
            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>描述：</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<input type="text" class="form-control" name="compeHie_descr" value="${comph.compeHie_descr }">
            </div>
        </div>
    </div>
</div>
  <div class="form-group">
     <div class="col-lg-2 col-lg-offset-10 col-md-4 col-md-offset-6 col-xs-4 col-xs-offset-6">
       <input type="submit" class="btn btn-primary" value="提交">
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
<title>修改竞赛等级</title>
</head>
<body>

	<form action="comphier_modify" method="post">"
		<input type="hidden" name="compeHie_id" value="${comph.compeHie_id }">
	名称：<input type="text" name="compeHie_name" value="${comph.compeHie_name }">
	描述：<input type="text" name="compeHie_descr" value="${comph.compeHie_descr }">
		 <input type="submit">
	</form>
</body>
</html> --%>