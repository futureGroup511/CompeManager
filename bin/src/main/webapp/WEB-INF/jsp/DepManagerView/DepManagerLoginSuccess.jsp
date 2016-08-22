<%@taglib prefix="s" uri="/struts-tags" %>
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
<title>学院负责人</title>
</head>
<body>
	<ul>
		<li><a href="depManager_applyCompeName">申报项目名称</a></li>
		<li><a href="depManager_seeAllApplyCompNames">查看申报项目名称审核状态</a></li>
		<li><a href="depManager_applyCompetitionPage">申报项目</a></li>
		<li><a href="depManager_seeAllApplyCompetition">查看申报项目审核状态</a></li>
		<!-- <li><a href="depManager_seeHistoryCompetition">历史申报项目</a></li> -->
		<li><a href="depManager_inspectStudentApplyPage">审核报名</a></li>
		<li>
				<s:if test="#request.compeList != null && #request.compeList.size() > 0">
					<s:form action="depManager_registerScore">
						<select name="compeId">
							<s:iterator value="#request.compeList" var="compe">
								<option value="<s:property value="#compe.compe_id" />"><s:date name="#compe.compe_requestDate" format="yyyy-MM-dd"/> 申请的 ${compe.compe_compeName.compeName_name}</option>
							</s:iterator>
						</select>
						<s:radio list="#{'1':'团体', '2':'个人' }" name="signType" value="1">
						</s:radio>
						<s:submit value="录入此竞赛成绩"></s:submit>
					</s:form>
				</s:if>
				<s:else>
					暂无竞赛结果需要填写
				</s:else>
		</li>
	</ul>
</body>
</html>