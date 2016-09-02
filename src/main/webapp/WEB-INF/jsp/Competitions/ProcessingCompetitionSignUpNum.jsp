<%@page import="org.dom4j.tree.BackedList"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>正在进行中的竞赛项目的报名人数</title>
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>css/xueyuan4.css"/>
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=basePath %>JQueryResources/fixError.js"></script>
</head>
<body>
<div class="dangqian">
    <div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：学院负责人>>竞赛报名情况</p>
        </div>
        <div class="col-lg-2 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎  ${sessionScope.depManager.depM_name } 登录本系统</p>
        </div>
    </div>
</div>
<div class="container"> 
     <table class=" table table-striped table-bordered table-hover">
     	<thead>
          <tr>
              <td align="center"><h4>竞赛负责人</h4></td>
              <td align="center"><h4>竞赛申报时间</h4></td>
              <td align="center"><h4>竞赛开始时间</h4></td>
              <td align="center"><h4>竞赛结束时间</h4></td>
              <td align="center"><h4>竞赛经费</h4></td>
              <td align="center"><h4>竞赛申报学院</h4></td>
              <td align="center"><h4>竞赛已报名人数</h4></td>
              <td align="center"><h4>查看报名详细情况</h4></td>
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
</div>
</body>
</html>