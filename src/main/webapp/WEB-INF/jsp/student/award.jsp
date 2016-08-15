<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>获奖名单</title>
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
						<th>获奖时间</th>
						<th>获奖等级</th>
						<th>获得奖金</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.recordlist }" varStatus="status" var="award">
						<tr>
							<td>${statu.index+1}</td>
							<td>${award.awardRecor_competition.compe_compeName.compeName_name }</td>
							<td>${award.awardRecor_awadHie }</td>
							<td></td>
						</tr>
					
					</c:forEach>
				
				</tbody>
		</table>
</body>
</html>