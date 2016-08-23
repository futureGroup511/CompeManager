<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<s:if test="competitionNames == null || competitionNames.size() == 0">
		当前没有已申请竞赛项目名称
	</s:if>
	<s:else>
	<table border="0" cellspacing="0" cellpadding="1">
		<tr>
			<th>竞赛项目名称</th>
			<th>竞赛项目级别</th> 
			<th>竞赛项目审核状态</th>
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
</body>
</html>