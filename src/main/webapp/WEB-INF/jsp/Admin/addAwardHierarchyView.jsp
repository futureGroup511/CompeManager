<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加获奖等级</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/jietu8.css" />
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>添加获奖等级</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-3 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>


 		
 		
 	
 	
<form action="admin_addAwardHierarchy" method="post">
	<div class="container">
	    <div class="row">
	        <div class="col-lg-3 col-lg-offset-1 col-md-3 col-md-offset-1 col-xs-3 col-xs-offset-1">
	        	<input type="text" class="form-control" name="awardhi.awardHie_name" placeholder="获奖等级名称">
	        </div>
	        <div class="col-lg-3  col-md-3 col-xs-3  ">
	        	<input type="text" class="form-control" name="awardhi.awardHie_descr" placeholder="获奖等级描述">
	        </div>
	        <div class="col-lg-1 col-md-2 col-xs-2"><p>获奖标准</p></div>
	        <div class="col-lg-2  col-md-2   col-xs-2  ">
	          	<select class="form-control" name="awardhi.awardHie_standard.award_id">
		 			<c:forEach items="${awardStandards}" var="awardstand">
		 				<option value="${awardstand.award_id}">${awardstand.award_type}</option>
		 			</c:forEach>
		 		</select>
	        </div>
	        <div class="col-lg-1 col-md-1 col-xs-1">
	        	<input class="btn btn-default  active" type="submit" value="提交">
	        </div>
	</div>
	</div>
</form>
</body>
</html>









<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加获奖等级</title>
</head>
<body>
 	<form action="admin_addAwardHierarchy" method="post">
 		<input type="text" name="awardhi.awardHie_name" placeholder="获奖等级名称">
 		<input type="text" name="awardhi.awardHie_descr" placeholder="获奖等级描述">
 		获奖标准:
 		<select name="awardhi.awardHie_standard.award_id">
 			<c:forEach items="${awardStandards}" var="awardstand">
 				<option value="${awardstand.award_id}">${awardstand.award_type}</option>
 			</c:forEach>
 		</select>
 		<input type="submit">
 	</form>
</body>
</html> --%>