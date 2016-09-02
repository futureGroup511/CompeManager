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
		        <div class="col-lg-2 col-lg-offset-6 col-md-3 col-md-offset-3 col-xs-5  col-xs-offset-1">
		            <p>当前位置：学生服务>>添加</p>
		        </div>
		        <div class="col-lg-2 col-md-3 col-xs-3">
		            <p>欢迎${stu.stu_name}登录本系统</p>
		        </div>
		  </div>
	</div>
	
	<%-- <div class="modal show ">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close"><span>&times;</span></button>
					<h1 class="text-center text-primary">添加学生</h1>
				</div>
				<div class="modal-body">
						<form action="student_addStudent" class="form col-md-12 center-block" method="POST">
							<div class="form-group">
								<input type="text" class="form-control input-lg" placeholder="账号" name="stu_num">
							</div>
							
							<div class="form-group">
								<input type="password" class="form-control input-lg" placeholder="密码" name="stu_password">
							</div>
							<div class="form-group">
								<input type="text" class="form-control input-lg" placeholder="姓名" name="stu_name">
							</div>
							<div class="form-group">
								<input type="text" class="form-control input-lg" placeholder="班级" name="stu_class">
							</div>
							<div>
								性别:<input type="radio"  name="stu_sex" value="男" required="required">男
									 <input type="radio"  name="stu_sex" value="女" required="required">女
							         <input type="radio"  name="stu_sex" value="其他" required="required">其他
							</div>
							<div class="form-group">
								<select name="stu_department.de_id">
									<c:forEach items="${departments}" var="department">
	     								<option value="${department.de_id}">${department.de_name }</option>
	     							</c:forEach>
								</select>
							</div>
							
							<button class="btn btn-primary btn-lg btn-block">确认添加</button>
						
						</form>
				</div>
				<div class="modal-footer">
				
				</div>
			</div>
		</div>
	</div> --%>
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
    
   <!--  <div class="form-group">
        <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">学院：</label>
        <div class="col-lg-5 col-md-5 col-xs-5">
            <input type="email" class="form-control " id="inputEmail2" >
        </div>
    </div> -->
    <div class="form-group">
        <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">班级：</label>
        <div class="col-lg-5 col-md-5 col-xs-5">
            <input placeholder="班级"  type="text" class="form-control input-lg" id="inputEmail2" >
        </div>
    </div>
    
    <!--缺少一个学院的for循环  -->

	<div class="form-group">
		 <label for="inputEmail3" class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">学院：</label>
		 <div class="col-lg-2 col-md-5 col-xs-5">
		 	 <select class="form-control input-lg">
	                      <option>信息工程学院</option>
	                      <option>艺术学院</option>
	                      <option>园艺园林学院</option>
	          </select>
		 
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
	
    
    <!-- <div class="row">
	    <div class="col-lg-1 col-lg-offset-5 col-md-1 col-md-offset-5 col-sm-1 col-sm-offset-5 control-label">
	    	<label  >性别：</label>
	    </div>
	 	<div class="radio col-lg-1">
	    
	          
	          <div class="col-lg-5 col-md-5 col-xs-5">
	           <label>
	           	<input type="radio" name="stu_sex" id="inlineRadio2" value="男">男	
	           
	           	</label>
	           <label>
	           	<input type="radio" name="stu_sex" id="inlineRadio2" value="女">女
	           </label>
       		   </div>
	          
	 	</div>
     
    </div>-->
    
    <!--  
       <button class="btn btn-primary" type="button">确认添加</button>
     </div> -->

    <div class="form-group">
	     <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-xs-4 col-xs-offset-5">
		   <button class="btn btn-primary " >确认添加</button>
		  </div>
	</div>
</form>
	


</body>
</html>
