<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报名情况</title>
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
					<th>报名时间</th>
					<th>类型</th>
					<th>状态</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.recordlist}" varStatus="status" var="signup">
					<tr>
						<td>${statu.index+1}</td>
						<td>${signup.signUp_competition.compe_compeName.compeName_name}</td>				
						<td>${signup.signUP_time}</td>
						<c:if test="${signup.signUP_type eq 1}"> 
							<td>团队</td>
						</c:if>
						<c:if test="${signup.signUP_type eq 2}" > 
							<td>个人</td>
						</c:if>
						<c:if test="${signup.signUp_status eq 1}"> 
							<td><span class="text-primary">待审核</span></td>
						</c:if>
						<c:if test="${signup.signUp_status eq 2}"> 
							<td><span class="text-seccess">通过</span></td>
						</c:if>
						<c:if test="${signup.signUp_status eq 3}"> 
							<td><span class="text-danger">未通过</span></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="center-block" style="width:500px">
			<ul class="pagination">
			<s:if test="#request.page.currentPage-1 <= 0">
				<li><a href="${pageContext.request.contextPath}/student_lookApplyStatus?currentPage=1"><span>&laquo;</span></a></li>
			</s:if>
			<s:elseif test="#request.page.currentPage-1 >= 1">
				<li><a href="${pageContext.request.contextPath}/student_lookApplyStatus?currentPage=${request.page.currentPage-1}"><span>&laquo;</span></a></li>				
			</s:elseif>
			<c:forEach begin="1" end="${request.page.pageCount}" varStatus="sta">
				<li><a href="${pageContext.request.contextPath}/student_lookApplyStatus?currentPage=${request.page.beginPageIndex+sta.index-1}">${request.page.beginPageIndex+sta.index-1}</a></li>	
			</c:forEach>
			
			<s:if test="#request.page.currentPage+1 > #request.page.pageCount">
				<li><a href="${pageContext.request.contextPath}/student_lookApplyStatus?currentPage=${request.page.pageCount}"><span>&raquo;</span></a></li>	
			</s:if>
			<s:elseif test="#request.page.currentPage+1 <= #request.page.pageCount">
				<li><a href="${pageContext.request.contextPath}/student_lookApplyStatus?currentPage=${request.page.currentPage+1}"><span>&raquo;</span></a></li>				
			</s:elseif>
			
			</ul>
		</div>
</body>
</html>