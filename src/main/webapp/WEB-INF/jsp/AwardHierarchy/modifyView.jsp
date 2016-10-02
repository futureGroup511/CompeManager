<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改获奖等级</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jietu17.css">
</head>

<body>
<div class="container">
  <div class="row">

        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处>>修改获奖等级</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>

<form action="awardhierar_modify" method="post">	
<input type="hidden" name="awardHie_id" value="${awardh.awardHie_id}">
<input type="hidden" name="awardHie_standard.award_id" value="${awardh.awardHie_standard.award_id}">
	<div class="container">
		<div class="one">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>奖励等级名称：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
		            <input type="text" class="form-control" name="awardHie_name" value="${awardh.awardHie_name}"> 
	            </div>
	            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>奖励等级描述：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text" class="form-control" name="awardHie_descr" value="${awardh.awardHie_descr}">
	            </div>
	        </div>
	    </div>
	</div>
	  <div class="form-group">
	     <div class="col-lg-2 col-lg-offset-10 col-md-4 col-md-offset-6 col-xs-4 col-xs-offset-6">
	       <input type="submit"  class="btn btn-primary" value="提交">
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
<title>修改获奖等级</title>
</head>
<body>
	<form action="awardhierar_modify" method="post">
		<input type="hidden" name="awardHie_id" value="${awardh.awardHie_id}">
		<input type="hidden" name="awardHie_standard.award_id" value="${awardh.awardHie_standard.award_id}">
	奖励等级名称：<input type="text" name="awardHie_name" value="${awardh.awardHie_name}">
	奖励等级描述: <input type="text" name="awardHie_descr" value="${awardh.awardHie_descr}">
		<input type="submit">
	</form>
</body>
</html> --%>