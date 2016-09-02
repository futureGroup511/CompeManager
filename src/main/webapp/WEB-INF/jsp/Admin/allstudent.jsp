<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所有学生</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jietu4.css">
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>查看所有学生</p>
        </div>
        <div class="col-lg-2 col-lg-offset-4 col-md-3 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-lg-2 col-lg-offset-2 col-md-2 col-md-offset-2 col-xs-2">
            <a href="student_addStudentView"><p>添加学生</p></a>
    </div>
   </div>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th>#</th>
         <th>学生姓名</th>
         <th>所属班级</th>
         <th>所属院系</th>
         <th>修改</th>
       </tr>
      </thead>
      <tbody>
        <c:forEach items="${ps.recordlist}" varStatus="status" var="stu">
					<tr>
					   	<th>${statu.index+1}</th>
						<th>${stu.stu_name }</th>
						<th>${stu.stu_class }</th>
						<th>${stu.stu_department.de_name }</th>
						<th><a href="admin_modifyStuView?stu.stu_id=${stu.stu_id}">修改</a></th>
					</tr>
				</c:forEach>
       </tbody>
      </table>
</div>
			
			
<div class="container">
  <div class="row">
   <div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-4 col-xs-5 col-xs-offset-4">
           <p class="xixnxi">每页显示${ps.pageSize }条，总记录数${ps.recordCount }条</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
           <nav>
          <ul class="pagination">
            </li>
            <li><a href="${pageContext.request.contextPath}/admin_findAllStudent?currentPage=1">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/admin_findAllStudent?currentPage=${ps.currentPage-1}">上一页</a></li>
            <li><a href="#">${ps.currentPage }/${ps.pageCount }</a></li>
            <li><a href="${pageContext.request.contextPath}/admin_findAllStudent?currentPage=${ps.currentPage+1}">下一页</a></li>
            <li><a href="${pageContext.request.contextPath}/admin_findAllStudent?currentPage=${ps.pageCount}">尾页</a></li>
            </li>
          </ul>
        </nav>
        </div>
      </div>
</div>
</body>
</html>




