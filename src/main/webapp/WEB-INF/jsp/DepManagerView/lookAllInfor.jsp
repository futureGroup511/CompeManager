<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xue2.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<title>通知界面</title>
</head>
<body>
	
	<div class="dangqian">
		  <div class="row">
		        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
		            <p>当前位置：查看通知</p>
		        </div>
		        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
		            <p>欢迎${sessionScope.depManager.depM_name}登录本系统</p>
		        </div>
		  </div>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="two">
						<th>#</th>
						<th>通知名称</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${p.recordlist}" var="no" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td><a href="depManager_lookinfo?noti_id=${no.noti_id }">${no.noti_title}</a></td>
					</tr>
			</c:forEach>
				
				</tbody>
		</table>
		
		</div>
	<div class="center-block" style="width:500px">
			<ul class="pagination">
			<s:if test="#request.p.currentPage-1 <= 0">
				<li><a href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=1"><span>&laquo;</span></a></li>
			</s:if>
			<s:elseif test="#request.p.currentPage-1 >= 1">
				<li><a href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=${request.p.currentPage-1}"><span>&laquo;</span></a></li>				
			</s:elseif>
			<c:forEach begin="${request.p.beginPageIndex}" end="${request.p.pageCount}" varStatus="sta">
				<c:if test="${request.p.currentPage eq sta.index}">
					<li><a style="background-color: #EA7B0B;" href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=${sta.index}">${sta.index}</a></li>
				</c:if>
				<c:if test="${request.p.currentPage ne sta.index}">
					<li><a #EA7B0B;" href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=${sta.index}">${sta.index}</a></li>
				</c:if>
					
			</c:forEach>
			
			<s:if test="#request.p.currentPage+1 > #request.p.pageCount">
				<li><a href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=${request.p.pageCount}"><span>&raquo;</span></a></li>	
			</s:if>
			<s:elseif test="#request.p.currentPage+1 <= #request.p.pageCount">
				<li><a href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=${request.p.currentPage+1}"><span>&raquo;</span></a></li>				
			</s:elseif>
			
			</ul>
		</div>
</body>
</html>