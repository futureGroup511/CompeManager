<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看竞赛信息</title>
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
              <th>竞赛审核状态</th>
              <th>查看详细</th>
          </tr>
      </thead>
      <tbody>
      	<s:if test="#request.pageBean == null || #request.pagBean.recordList.size() == 0">
      		<tr>
      			<td colspan="8">当前没有竞赛信息！！！！！</td>
      		</tr>
      	</s:if>
      	<s:else>
      		<s:iterator value="#request.pageBean.recordList" var="competition">
      			<tr>
      				<td>${competition.compe_manager}</td>
      				<td><s:date name="#competition.compe_requestDate" format="yyyy-MM-dd"/></td>
      				<td><s:date name="#competition.compe_startTime" format="yyyy-MM-dd"/></td>
      				<td><s:date name="#competition.compe_endTime" format="yyyy-MM-dd"/></td>
      				<td>${competition.compe_money}</td>	
      				<td>${sessionScope.depManager.depM_department.de_name}</td>	
      				<td>${competition.compe_status==1?"已申请，正在审核":competition.compe_status==2?"审核通过":competition.compe_status==3?"竞赛正在进行中":competition.compe_status==4?"竞赛已经结束":"审核未通过"}</td>	
      				<td><a href="depManager_seeCompetitionDetail?compeId=${competition.compe_id }">查看详细</a></td>	
      			</tr>
      		</s:iterator>
      		<tr>
      			<td><a href="depManager_seeAllApplyCompetition?currentPage=0">首页</a></td>
      			<td><a href="depManager_seeAllApplyCompetition?currentPage=${currentPage-1<0?0:currentPage-1}">上一页</a></td>
      			<td><a href="depManager_seeAllApplyCompetition?currentPage=${currentPage+1>requestScope.pageBean.pageCount?requestScope.pageBean.pageCount:currentPage+1}">下一页</a></td>
      			<td><a href="depManager_seeAllApplyCompetition?currentPage=${requestScope.pageBean.pageCount }">尾页</a></td>
      		</tr>
      	</s:else>
      </tbody>
</table>
</body>
</html>