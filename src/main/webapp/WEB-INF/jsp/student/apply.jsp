<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报名页面</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
		<jsp:include page="operation.jsp"></jsp:include>
		
		
		<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>竞赛名称</th>
						<th>报名</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${request.ps.recordlist}" var="competition" varStatus="status" >
						<tr>
							 <td>${status.index+1}</td>
							 <td><a href="${pageContext.request.contextPath}/student_lookDescComp?compe_id=${competition.compe_id}">${competition.compe_compeName.compeName_name }</a></td> 
							 <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/student_lookDescComp?compe_id=${competition.compe_id}">报名</a></td> 
						<tr>
					</c:forEach>
				</tbody>
		</table>	
		<div class="center-block" style="width: 300px">
			<ul class="pagination">
			<s:if test="#request.ps.beginPageIndex-1 <= 0">
				<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=1"><span>&laquo;</span></a></li>	
			</s:if>
			<s:elseif test="#request.ps.beginPageIndex-1 >= 1">
				<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=${request.ps.beginPageIndex-1}"><span>&laquo;</span></a></li>				
			</s:elseif>
			<c:forEach begin="1" end="${request.ps.pageCount}" varStatus="sta">
				<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=${request.ps.beginPageIndex+sta.index-1}">${request.ps.beginPageIndex+sta.index-1}</a></li>	
			</c:forEach>
			
			<s:if test="#request.ps.endPageIndex+1 > #request.ps.pageCount">
				<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=${request.ps.pageCount}"><span>&raquo;</span></a></li>	
			</s:if>
			<s:elseif test="#request.ps.beginPageIndex+1 <= #request.ps.pageCount">
				<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=${request.ps.beginPageIndex+1}"><span>&raquo;</span></a></li>				
			</s:elseif>
			
			</ul>
		</div>
				
</body>
</html>