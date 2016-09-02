<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学院负责人页面</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/jietu11.css" />
</head>

<body>
<div class="add">
	<div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：学院负责人服务>>添加学院负责人</p>
        </div>
        <div class="col-lg-2 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
    </div>
</div>

	
<form action="admin_addDepartmentManager" method="post">	
	<div class="container">
		<div class="one">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>姓名：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text"  class="form-control" name="dm.depM_name" value="" required="required">
	            </div>
	            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>电话号码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text" class="form-control" name="dm.depM_phoneNum" value="" required="required">
	            </div>
	            
	        </div>
	    </div>
	    <div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>密码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="password"  class="form-control" name="dm.depM_password" value="" required="required">
	            </div>
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>工号：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text"  class="form-control" name="dm.depM_num" value="" required="required">
	            </div> 
	        </div>
	    </div>
	    <div class="three">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>所属院系</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            
	           		 <select class="form-control" name="dm.depM_department.de_id" required="required">
						<c:forEach items="${departments}" var="department">
				     		<option value="${department.de_id}">${department.de_name }</option>
				     	</c:forEach>	
					</select>
					
	            </div>
	            <div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><span>性别：</span></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	                  <label class="redio-inline redio-one">
	                  	<input type="radio"  name="dm.depM_sex" value="男" id="inlineRadiol" required="required">男
	                  </label>
	                   <label class="redio-inline redio-two">
	                  	<input type="radio"  name="dm.depM_sex" value="女"  id="inlineRadio2" required="required">女
	                  </label>
	            </div>
	        </div>
	     </div>
	</div>
	<div class="last">
	<input type="submit" class="btn btn-default  active">
 	</div>
</form>

</body>
</html>













<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学院负责人页面</title>
</head>
<body>
	<form action="admin_addDepartmentManager" method="post">
	姓名:<input type="text"  name="dm.depM_name" value="" required="required">
	工号:<input type="text"  name="dm.depM_num" value="" required="required">
	密码:<input type="password"  name="dm.depM_password" value="" required="required">
	性别:<input type="radio"  name="dm.depM_sex" value="男" required="required">男
		 <input type="radio"  name="dm.depM_sex" value="女" required="required">女
         <input type="radio"  name="dm.depM_sex" value="其他" required="required">其他
	电话号码:<input type="text"  name="dm.depM_phoneNum" value="" required="required">
	负责院系:
		<select name="dm.depM_department.de_id" required="required">
			<c:forEach items="${departments}" var="department">
	     		<option value="${department.de_id}">${department.de_name }</option>
	     	</c:forEach>	
		</select>
		<input type="submit">
	</form>
</body>
</html> --%>