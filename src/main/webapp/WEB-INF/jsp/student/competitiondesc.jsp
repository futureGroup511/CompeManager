<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>竞赛详细信息</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
		<jsp:include page="operation.jsp"></jsp:include>
		<div class="col-lg-8 col-lg-offset-2">
			<div class="panel panel-default" style="margin-top: 50px">
			<div class="panel-heading">
				<h3 class="panel-title">竞赛详细信息</h3>			
			</div>
			<div class="panel-body">
							<table class="table-hover table-bordered col-md-12">
								<tbody>
									<tr>
										<td class="col-md-4"><h4 class=" text-lg">竞赛等级:</h4></td>
										<td class="col-md-8 "><h4 class="text-lg">${comp.compe_compeName.compeName_compeHierarchy.compeHie_name }</h4></td>
									</tr>
									<tr>
										<td class="col-md-4"><h4 class=" text-lg">竞赛类型:</h4></td>
										<s:if test="#request.comp.compe_type==1">
											<td class="col-md-8 "><h4 class="text-lg">团队</h4></td>
											<input type="text" hidden name="sup.singnUP_type" value="${comp.compe_type}">
										</s:if>
										<s:if test="#request.comp.compe_type==2">
											<td class="col-md-8 "><h4 class="text-lg">个人</h4></td>
											<input type="text" hidden name="sup.singnUP_type" value="${comp.compe_type}">
										</s:if>
										<s:if test="#request.comp.compe_type==3">
											<td class="col-md-8 "><h4 class="text-lg">其他(包含个人和团队)</h4></td>
										</s:if>
									</tr>
									<tr>
										<td class="col-md-4"><h4 class=" text-lg">竞赛名称:</h4></td>
										<td class="col-md-8 "><h4 class="text-lg">${comp.compe_compeName.compeName_name }</h4></td>
									</tr>
									<tr>
										<td class="col-md-4"><h4 class=" text-lg">竞赛开始时间：</h4></td>
										<td class="col-md-8 "><h4 class=" text-lg">${comp.compe_startTime}</h4></td>
									</tr>
									<tr>
										<td class="col-md-4"><h4 class=" text-lg">竞赛结束时间：</h4></td>	
										<td class="col-md-8 "><h4 class=" text-lg">${comp.compe_endTime}</h4></td>
									</tr>
									<tr>
										<td class="col-md-4"><h4 class=" text-lg">摘要:</h4></td>
										<td class="col-md-8"><h4 class=" text-lg">${comp.compe_digest }</h4></td>
									</tr>
									<tr>
										<td class="col-md-4"><h4 class=" text-lg">所属院系:</h4></td>
										<td class="col-md-8"><h4 class=" text-lg">${comp.compe_department.de_name }</h4></td>
									</tr>
									<tr>
										<td class="col-md-4"><h4 class=" text-lg">项目负责人:</h4></td>
										<td class="col-md-8"><h4 class=" text-lg">${comp.compe_manager }</h4></td>
									</tr>
								</tbody>
							</table>
							<div>
								<a class="btn btn-primary col-md-4 col-md-offset-4" href="${pageContext.request.contextPath}/student_fillentryform?compe_id=${comp.compe_id}">报名</a>
							</div>
			</div>
			<div class="panel-footer">
			
			</div>
		</div>
		</div>
		
</body>
</html>