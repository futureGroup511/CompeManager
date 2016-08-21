<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>申请竞赛</title>
	<script src="${pageContext.request.contextPath}/JQueryResources/laydate/laydate.js"></script>
</head>
<body>
	<s:form method="post" action="depManager_saveApplyCompetition" enctype="multipart/form-data">
		竞赛负责人:<s:textfield name="compe_manager"></s:textfield><br/>
		竞赛申报时间: <s:textfield name="compe_requestDate" placeholder="请输入日期" class="laydate-icon" onclick="laydate()"></s:textfield><br/>
		竞赛开始时间：<s:textfield name="compe_startTime" placeholder="请输入日期" class="laydate-icon" onclick="laydate()"></s:textfield><br/>
		竞赛结束时间<s:textfield name="compe_endTime" placeholder="请输入日期" class="laydate-icon" onclick="laydate()"></s:textfield><br/>
		所需经费：<s:textfield name="compe_money"></s:textfield><br/>
		竞赛类型：<s:select list="#{'0':'==请选择==','1':'团体', '2':'个人', '3':'团体/个人' }" name="compe_type"></s:select><br/>
		竞赛名称：<s:select list="competitionNames" listKey="compeName_id" listValue="compeName_name" name="compe_compeName.compeName_id"></s:select><br/>
		<s:label for="">所申报学院：</s:label><s:textfield readonly="true"  value="%{#session.depManager.depM_department.de_name}"></s:textfield><br/>
				<s:textfield name="compe_department.de_id" type="hidden" value="%{#session.depManager.depM_department.de_id}"></s:textfield><br/>
		<s:label for="">竞赛方案：</s:label><s:file name="compeProgramFile"></s:file><br/>
		<s:textarea name="compe_digest" cols="40" rows="25"></s:textarea><br/>
		<s:submit value="提交竞赛申请"></s:submit>
	</s:form>
</body>
</html>