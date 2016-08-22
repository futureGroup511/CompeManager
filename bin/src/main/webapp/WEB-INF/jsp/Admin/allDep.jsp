<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所有学院负责人</title>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
	<table class="table table-bordered table-hover">
		<thead>
				<tr>
					<th>#</th>
					<th>负责人姓名</th>
					<th>所属院系</th>
					<th>性别</th>
					<th>电话</th>
					<th>修改</th>
				</tr>
		</thead>
		<tbody>
				<c:forEach items="${ps.recordlist}" varStatus="status" var="Dep">
					<tr>
					   	<th>${statu.index+1}</th>
						<th>${Dep.depM_name }</th>
						<th>${Dep.depM_department.de_name }</th>
						<th>${Dep.depM_sex }</th>
						<th>${Dep.depM_phoneNum }</th>
						<th><a href="admin_modifyDep?dm.depM_id=${Dep.depM_id}">修改</a></th>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<div class="center-block" style="width:500px">
			<ul class="pagination">
			<s:if test="#request.ps.currentPage-1 <= 0">
				<li><a href="${pageContext.request.contextPath}/admin_findAll?currentPage=1"><span>&laquo;</span></a></li>
			</s:if>
			<s:elseif test="#request.ps.currentPage-1 >= 1">
				<li><a href="${pageContext.request.contextPath}/admin_findAll?currentPage=${ps.currentPage-1}"><span>&laquo;</span></a></li>				
			</s:elseif>
			<c:forEach begin="1" end="${request.ps.pageCount}" varStatus="sta">
				<li><a href="${pageContext.request.contextPath}/admin_findAll?currentPage=${ps.beginPageIndex+sta.index-1}">${ps.beginPageIndex+sta.index-1}</a></li>	
			</c:forEach>
			
			<s:if test="#request.ps.currentPage+1 > #request.ps.pageCount">
				<li><a href="${pageContext.request.contextPath}/admin_findAll?currentPage=${ps.pageCount}"><span>&raquo;</span></a></li>	
			</s:if>
			<s:elseif test="#request.ps.currentPage+1 <= #request.ps.pageCount">
				<li><a href="${pageContext.request.contextPath}/admin_findAll?currentPage=${ps.currentPage+1}"><span>&raquo;</span></a></li>				
			</s:elseif>
			
			</ul>
		</div>
		
		
</body>
</html>