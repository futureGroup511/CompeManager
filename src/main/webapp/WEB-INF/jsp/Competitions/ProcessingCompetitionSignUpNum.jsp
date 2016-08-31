<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>正在进行中的竞赛项目的报名人数</title>
<style type="text/css">
	a:HOVER {
		color: red;
	}
</style>
</head>
<body>
	<table style="font-size:12px;">
      <thead>
          <tr>
              <th>竞赛负责人</th>
              <th>竞赛申报时间</th>
              <th>竞赛开始时间</th>
              <th>竞赛结束时间</th>
              <th>竞赛经费</th>
              <th>竞赛申请学院</th>
              <th>竞赛已报名人数</th>
              <th>查看报名详细情况</th>
          </tr>
      </thead>
      <tbody>
      	<s:if test="#request.compeList == null || #request.compeList.size() == 0">
      		<tr>
      			<td colspan="8">当前没有竞赛信息！！！！！</td>
      		</tr>
      	</s:if>
      	<s:else>
      		<s:iterator value="#request.compeList" var="competition">
      			<tr>
      				<td>${competition.compe_manager}</td>
      				<td><s:date name="#competition.compe_requestDate" format="yyyy-MM-dd"/></td>
      				<td><s:date name="#competition.compe_startTime" format="yyyy-MM-dd"/></td>
      				<td><s:date name="#competition.compe_endTime" format="yyyy-MM-dd"/></td>
      				<td>${competition.compe_money}</td>	
      				<td>${sessionScope.depManager.depM_department.de_name}</td>	
      				<td><s:property value="#request.compeSignUpsMap[#competition.compe_id]"/></td>
      				<td><a href="depManager_seeSignUpsDetails?compeId=${competition.compe_id }">查看详细情况</a></td>	
      			</tr>
      		</s:iterator>
      	</s:else>
      </tbody>
</table>
</body>
</html>