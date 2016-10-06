<%--  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生界面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xue3.css">

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/jietu2.css" />
</head>

<body>

<div class="container">
  <div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>添加学生</p>
        </div>
        <div class="col-lg-2 col-lg-offset-4 col-md-3 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>












<form action="student_addStudent" class="form-horizontal" role="form" method="post">
	<div class="container">
		<div class="one">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>学号：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text" class="form-control"  placeholder="学号" name="stu_num" > 
	            </div>
	            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>姓名：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="text" class="form-control" placeholder="姓名" name="stu_name">
	            </div>
	            
	        </div>
	    </div>
	    <div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>密码：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input type="password" class="form-control" placeholder="密码" name="stu_password">
	            </div>
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>班级：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            <input placeholder="班级"  type="text" class="form-control" id="inputEmail2" >
	            </div> 
	        </div>
	    </div>
	    <div class="three">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>院系</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	           		 <select class="form-control">
		                      <option>信息工程学院</option>
		                      <option>艺术学院</option>
		                      <option>园艺园林学院</option>
		          </select>
	            </div>
	            <div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><span>性别：</span></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	                  <label class="redio-inline redio-one">
	                  	<input type="radio" name="stu_sex" id="inlineRadiol" value="男">男
	                  </label>
	                   <label class="redio-inline redio-two">
	                  	<input type="radio" name="stu_sex" id="inlineRadio2" value="女">女
	                  </label>
	            </div>
	        </div>
	     </div>
	</div>
</form>
<div class="last">
	<button class="btn btn-default  active" >确认添加</button>
</div>
</body>
</html>

 --%>





<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生界面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xue3.css">

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>.
	
	<div class="dangqian">
		  <div class="row">
		        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
		            <p>当前位置：学生服务>>添加学生</p>
		        </div>
		        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
		            <p>欢迎${admin.ad_name}登录本系统</p>
		        </div>
		  </div>
	</div>
	<div class="container">
  <div class="row">
      <div class="col-lg-3 col-lg-offset-6 col-md-4 col-md-offset-5 col-xs-4 col-xs-offset-4">
         <p>添加学生</p>
      </div>
  </div>
</div>
<form action="student_addStudent" class="form-horizontal" role="form" method="post">

	<div class="form-group">
        <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">账号：</label>
        <div class="col-lg-5 col-md-5 col-xs-5">
            <input type="text" class="form-control input-lg"  placeholder="账号" name="stu_num" >
        </div>
    </div>
    
    <div class="form-group">
        <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">密码：</label>
        <div class="col-lg-5 col-md-5 col-xs-5">
           <input type="password" class="form-control input-lg" placeholder="密码" name="stu_password">
        </div>
    </div>
    <div class="form-group">
        <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">姓名：</label>
        <div class="col-lg-5 col-md-5 col-xs-5">
           <input type="text" class="form-control input-lg" placeholder="姓名" name="stu_name">
        </div>
    </div>
    
    
    
    <!--缺少一个学院的for循环  -->

	<div class="form-group">
		 <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">学院：</label>
		 <div class="col-lg-2 col-md-5 col-xs-5">
		 	 <select class="form-control input-lg" name="depatrment_id">
		 	 	<c:forEach items="${departments}" var="depatrment">
		 	 		 <option value="${depatrment.de_id}">${depatrment.de_name}</option>
		 	 	</c:forEach>
	          </select>
		 </div>
	</div>
	<div class="form-group">
        <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">年级：</label>
        <div class="col-lg-5 col-md-5 col-xs-5">
            <input placeholder="年级"  name= "stu_grade" type="text" class="form-control input-lg" id="inputEmail2" >
        </div>
    </div>
	<div class="form-group">
        <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">专业：</label>
        <div class="col-lg-5 col-md-5 col-xs-5">
            <input placeholder="专业"  name= "stu_major" type="text" class="form-control input-lg" id="inputEmail2" >
        </div>
    </div>
    
	<div class="form-group">
        <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">班级：</label>
        <div class="col-lg-5 col-md-5 col-xs-5">
            <input placeholder="班级"  name="stu_class" type="text" class="form-control input-lg" id="inputEmail2" >
        </div>
    </div>
    
	<div class="form-group">
       <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label"><span><strong>性别：</strong>       </span></label> 
       <label class="redio-inline col-lg-1">
            <input type="radio" name="stu_sex" id="inlineRadiol" value="男">男
       </label>
       <label class="redio-inline col-lg-1">
            <input type="radio" name="stu_sex" id="inlineRadio2" value="女">女
       </label>
   </div>
	<div class="form-group">
        <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">身份证号：</label>
        <div class="col-lg-5 col-md-5 col-xs-5">
            <input placeholder="身份证"  name="stu_idCard" type="text" class="form-control input-lg" id="inputEmail2" >
        </div>
    </div>
    <div class="form-group">
	     <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-xs-4 col-xs-offset-5">
		   <button class="btn btn-primary " >确认添加</button>
		  </div>
	</div>
</form>
	


</body>
</html>
