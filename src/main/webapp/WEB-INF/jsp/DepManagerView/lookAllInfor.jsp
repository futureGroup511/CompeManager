<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<title>通知界面</title>
</head>
<body>

	<span>通知</span>
	<table>
		<tbody>
			<c:forEach items="${p.recordlist}" var="no">
				<tr>
					<td><a href="depManager_lookinfo?noti_id=${no.noti_id }">${no.noti_title}</a></td>
				</tr>
			</c:forEach>	
		</tbody>
	</table>
	<div class="center-block" style="width:500px">
			<ul class="pagination">
			<s:if test="#request.p.currentPage-1 <= 0">
				<li><a href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=1"><span>&laquo;</span></a></li>
			</s:if>
			<s:elseif test="#request.p.currentPage-1 >= 1">
				<li><a href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=${request.p.currentPage-1}"><span>&laquo;</span></a></li>				
			</s:elseif>
			<c:forEach begin="1" end="${request.p.pageCount}" varStatus="sta">
				<li><a href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=${request.p.beginPageIndex+sta.index-1}">${request.p.beginPageIndex+sta.index-1}</a></li>	
			</c:forEach>
			
			<s:if test="#request.p.currentPage+1 => #request.p.pageCount">
				<li><a href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=${request.p.pageCount}"><span>&raquo;</span></a></li>	
			</s:if>
			<s:elseif test="#request.p.currentPage+1 < #request.p.pageCount">
				<li><a href="${pageContext.request.contextPath}/depManager_lookInformView?currentPage=${request.p.currentPage+1}"><span>&raquo;</span></a></li>				
			</s:elseif>
			
			</ul>
		</div>
</body>
</html>