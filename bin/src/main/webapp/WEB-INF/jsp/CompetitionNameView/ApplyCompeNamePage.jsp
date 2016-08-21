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
<title>Insert title here</title>
</head>
<body>
	<s:form method="post" action="depManager_saveCompeName">
		<s:label>竞赛名称：</s:label><s:textfield name="competitionName.compeName_name"></s:textfield><br/>
		<s:if test="competitionHierarchies == null || competitionHierarchies.size() <= 0">
			<s:label>竞赛等级</s:label><s:select list="#{'0':'暂无比赛等级'}"></s:select><br/>
		</s:if>
		<s:else>
			<s:label>竞赛等级</s:label><s:select name="competitionName.compeName_compeHierarchy.compeHie_id" list="competitionHierarchies" listKey="compeHie_id" listValue="compeHie_name" headerKey="0" headerValue="==请选择竞赛级别=="></s:select><br/>
		</s:else>
		<s:label>竞赛相关描述</s:label><s:textarea name="competitionName.compeName_descr" cols="30" rows="10">
		</s:textarea><br/>
		<s:submit value="提交竞赛名称申请"></s:submit>
	</s:form>
</body>
</html>