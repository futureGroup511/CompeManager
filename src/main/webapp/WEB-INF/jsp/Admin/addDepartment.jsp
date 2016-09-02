<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学院</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/jietu5.css" />
</head>

<body>



		
	

<div class="container">
  <div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>添加学院</p>
        </div>
        <div class="col-lg-2 col-lg-offset-4 col-md-3 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>


		
		
		
		
		
<form action="admin_addDepartment" method="post">
<div class="container">
    <div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-3 col-md-offset-1 col-xs-3 col-xs-offset-1">
        	<input type="text" class="form-control" name="department.de_descr" placeholder="学院描述" required="required">
        </div>
        <div class="col-lg-3  col-md-3 col-xs-3  ">
        	<input type="text" class="form-control" name="department.de_name" placeholder="学院名称" required="required">
        </div>
        <div class="col-lg-3  col-md-3   col-xs-3  ">
           	<select class="form-control" name="department.de_depM.depM_id">
			<c:forEach items="${depManagers}" var="depManager">
				<option value="${depManager.depM_id}">${depManager.depM_name }</option>			
			</c:forEach>
		</select>
        </div>
        <div class="col-lg-1 col-md-1 col-xs-2">
        	<input type="submit" class="btn btn-default  active">
        </div>
</div>
</div>
</form>
</body>
</html>






<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学院</title>
</head>
<body>
	
	<form action="admin_addDepartment" method="post">
		<input type="text" name="department.de_name" placeholder="学院名称" required="required">
		<input type="text" name="department.de_descr" placeholder="学院描述" required="required">
		<select name="department.de_depM.depM_id">
			<c:forEach items="${depManagers}" var="depManager">
				<option value="${depManager.depM_id}">${depManager.depM_name }</option>			
			</c:forEach>
		</select>
		<input type="submit">
	</form>
</body>
</html> --%>