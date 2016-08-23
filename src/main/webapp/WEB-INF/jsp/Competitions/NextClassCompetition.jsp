<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<s:property value="#request.compeList.size()"/>
		<table>
		<thead>
			<tr>
			  <th>竞赛名称</th>
			  <th>竞赛申报学院</th>
              <th>竞赛负责人</th>
              <th>开始下级比赛</th>
          </tr>
		</thead>
		<s:if test="#request.compeList != null && #request.compeList.size() > 0">
			<s:iterator value="#request.compeList" var="competition">
				<tr>
					<td><s:property value="#competition.compe_compeName.compeName_name"/></td>
					<td><s:property value="#competition.compe_department.de_name"/></td>
					<td><s:property value="#competition.compe_manager"/></td>
					<td>
						<s:if test="#competition.compe_status == 3">
							<a href="depManager_startNextClassCompetition?compeId=${competition.compe_id }">开始下级比赛</a>
						</s:if>
						<s:else>
							正在录入成绩/比赛进行中
						</s:else>
					</td>
				</tr>
			</s:iterator>
		</s:if>
		<s:else>
			暂没有符合进入下级比赛的比赛
		</s:else>
	</table>
</body>
</html>