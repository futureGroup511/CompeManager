<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生页面</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/jietu13.css" />
</head>

<body>
<div class="add">
	<div class="row">
         <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：学生服务>>修改学生信息</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
    </div>
</div>

	
<form action="admin_modifyStu" method="post">
	<input hidden type="text" name="stu.stu_id" value="${stu.stu_id }">
	<input hidden type="text" name="stu.stu_department.de_id" value="${stu.stu_department.de_id}">
	<input hidden type="text" name="stu.stu_sex" value="${stu.stu_sex }">	
	<div class="container">
		<div class="one">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>姓名：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input  type="text" class="form-control" name="stu.stu_name" value="${stu.stu_name }">
	            </div>
	            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>账号：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input  type="text" class="form-control" name="stu.stu_num" value="${stu.stu_num }" readonly="readonly">
	            </div>
	            
	        </div>
	    </div>
	    <div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>密码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input  type="text" class="form-control" name="stu.stu_password" value="${stu.stu_password }" >
	            </div>
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>班级：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input  type="text" class="form-control" name="stu.stu_class" value="${stu.stu_class }" >
	            </div> 
	        </div>
	    </div>
	    <div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>年级：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input  type="text" class="form-control" name="stu.stu_grade" value="${stu.stu_grade }" >
	            </div>
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>专业：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input  type="text" class="form-control" name="stu.stu_major" value="${stu.stu_major }" >
	            </div> 
	        </div>
	    </div>
	    <div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>联系方式：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input  type="text" class="form-control" name="stu.stu_grade" value="${stu.stu_phone}" >
	            </div>
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>性别：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<c:if test="${stu.stu_sex eq '男' }" >
		            	<input  type="radio"  name="stu.stu_sex" value="男" checked="checked" style="margin-left: 35%;">男
		            	<input  type="radio"  name="stu.stu_sex" value="女" style="">女
	            	</c:if>
	            	<c:if test="${stu.stu_sex eq '女' }" >
		            	<input  type="radio" name="stu.stu_sex" value="男" >男
		            	<input  type="radio"  name="stu.stu_sex" value="女" checked="checked" >女
	            	</c:if>
	            </div> 
	        </div>
	    </div>
	    <div class="three">
	    	<div class="row">
	    		<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>身份证：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input  type="text" class="form-control" name="stu.stu_idCard" value="${stu.stu_idCard}" >
	            </div>
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>院系</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<select name="de_id" class="form-control input-lg">
	            		<c:forEach items="${departments}" var="department">
	            			<option value="${department.de_id}">${department.de_name }</option>
	            		</c:forEach>
	            		
	            	</select>
	            	<%-- <input  type="text" class="form-control" readonly ="readonly"  value="${stu.stu_department.de_name }" > --%>
	            </div>
	        </div>
	     </div>
	</div>
	<div class="last">
	        <input type="submit" class="btn btn-default  active" value="提交">
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
<title>修改学生页面</title>
</head>
<body>


	<form action="admin_modifyStu" method="post">
			<input hidden type="text" name="stu.stu_id" value="${stu.stu_id }">
			<input hidden type="text" name="stu.stu_department.de_id" value="${stu.stu_department.de_id}">
			<input hidden type="text" name="stu.stu_sex" value="${stu.stu_sex }">
		姓名:<input  type="text" name="stu.stu_name" value="${stu.stu_name }">
		账号:<input  type="text" name="stu.stu_num" value="${stu.stu_num }" readonly="readonly">
		密码:<input  type="text" name="stu.stu_password" value="${stu.stu_password }" >
		班级:<input  type="text" name="stu.stu_class" value="${stu.stu_class }" >
		院系:<input  type="text" readonly ="readonly"  value="${stu.stu_department.de_name }" >
			<input type="submit">
	</form>
	

</body>
</html> --%>