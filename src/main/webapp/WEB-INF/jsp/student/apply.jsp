<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报名页面</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xue2.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
		<jsp:include page="operation.jsp"></jsp:include>
		<div class="dangqian">
		  <div class="row">
		        <div class="col-lg-2 col-lg-offset-6 col-md-3 col-md-offset-3 col-xs-5  col-xs-offset-1">
		            <p>当前位置：学生服务>>报名</p>
		        </div>
		        <div class="col-lg-2 col-md-3 col-xs-3">
		            <p>欢迎,${stu.stu_name}登录本系统</p>
		        </div>
		  </div>
		</div>
		
		<div class="table-responsive">
			<table class="table table table-bordered table-hover table-striped">
				<thead>
					<tr class="two">
						<th>#</th>
						<th>竞赛名称</th>
						<th>竞赛开始时间</th>
						<th>竞赛结束时间</th>
						<th>竞赛等级</th>
						<th>报名</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${request.ps.recordlist}" var="competition" varStatus="status" >
						<tr>
							 <td>${status.index+1}</td>
							 <td><a href="${pageContext.request.contextPath}/student_lookDescComp?compe_id=${competition.compe_id}">${competition.compe_compeName.compeName_name }</a></td>
							 <td>${fn:substring(competition.compe_startTime, 0, 11) }</td>
							 <td>${fn:substring(competition.compe_endTime, 0, 11)}</td>
							 <td>${competition.compe_compeName.compeName_compeHierarchy.compeHie_name }</td>
							 <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/student_lookDescComp?compe_id=${competition.compe_id}">报名</a></td> 
						<tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
			
			
		<div class="row">
			<div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-5 col-sm-5 col-sm-offset-5">
				<ul class="pagination">
				<s:if test="#request.ps.currentPage-1 <= 0">
					<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=1"><span>&laquo;</span></a></li>	
				</s:if>
				<s:elseif test="#request.ps.currentPage-1 >= 1">
					<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=${request.ps.currentPage-1}"><span>&laquo;</span></a></li>				
				</s:elseif>
				<c:forEach begin="1" end="${request.ps.pageCount}" varStatus="sta">
					<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=${request.ps.beginPageIndex+sta.index-1}">${request.ps.beginPageIndex+sta.index-1}</a></li>	
				</c:forEach>
				
				<s:if test="#request.ps.currentPage+1 > #request.ps.pageCount">
					<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=${request.ps.pageCount}"><span>&raquo;</span></a></li>	
				</s:if>
				<s:elseif test="#request.ps.currentPage+1 <= #request.ps.pageCount">
					<li><a href="${pageContext.request.contextPath}/student_apply?currentPage=${request.ps.currentPage+1}"><span>&raquo;</span></a></li>				
				</s:elseif>
				
				</ul>
			
			</div>
			<div class="col-lg-2 col-md-2 col-sm-2">
  			</div>
			
		</div>
				
</body>
</html>