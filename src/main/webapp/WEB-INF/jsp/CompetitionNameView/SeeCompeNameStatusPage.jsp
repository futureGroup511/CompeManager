<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>css/xueyuan1-2.css" />
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=basePath %>JQueryResources/fixError.js"></script>
</head>
<body>
		<div class="dangqian">
    		<div class="row">
		        <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
		            <a> <p>  </p> </a>
		        </div>
		        <div class="col-lg-2 col-lg-offset-6 col-md-3 col-md-offset-3 col-xs-5  col-xs-offset-1">
		            <p>当前位置：学院负责人>>竞赛名称审核状态</p>
		        </div>
		        <div class="col-lg-2 col-md-3 col-xs-3">
		            <p>欢迎 	${sessionScope.depManager.depM_name }  登录本系统</p>
		        </div>
    		</div>
		</div>
	<div class="container">
	<s:if test="competitionNames == null || competitionNames.size() == 0">
		当前没有已申请竞赛项目名称
	</s:if>
	<s:else>
	<table class="table table-striped table-bordered table-hover">
		<tr>
			<th align="center">竞赛项目名称</th>
			<th align="center">竞赛项目级别</th> 
			<th align="center">竞赛项目审核状态</th>
		</tr>
		<s:iterator value="competitionNames" var="compeName">
			<tr>
				<td>${compeName.compeName_name}</td>
				<td>${compeName.compeName_compeHierarchy.compeHie_name }</td>
				<td>${compeName.compeName_status==1?"正在审核":compeName.compeName_status ==2?"审核成功":"审核失败"}</td>
			</tr>
		</s:iterator>
	</table>
	</s:else>
	</div>
</body>
</html>