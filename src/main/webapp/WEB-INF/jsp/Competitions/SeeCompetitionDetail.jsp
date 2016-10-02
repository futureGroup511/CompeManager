<%@ taglib prefix="s" uri="/struts-tags" %>
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
		<title>查看竞赛的详细信息</title>
		<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
		<link rel="stylesheet" href="<%=basePath %>css/xueyuan4.css"/>
		<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<script type="text/javascript" src="<%=basePath %>JQueryResources/fixError.js"></script>
	</head>
	<body>
	<div class="dangqian">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：学院负责人>>竞赛详细信息</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎  ${sessionScope.depManager.depM_name } 登录本系统</p>
        </div>
    </div>
</div>
	<div class="container"> 
     <table class=" table table-striped table-bordered table-hover">
		<thead>
			<tr>
              <th>负责人</th>
              <th>申报时间</th>
              <th>开始时间</th>
              <th>结束时间</th>
              <th>经费</th>
              <th>审核状态</th>
              <th>类型</th>
              <th>摘要</th>
              <th>下载竞赛方案</th>
              
          </tr>
		</thead>
		<tr>
			<td>${requestScope.compe.compe_manager }</td>
			<td><s:date name="#request.compe.compe_requestDate" format="yyyy-MM-dd"/></td>
			<td><s:date name="#request.compe.compe_startTime" format="yyyy-MM-dd"/></td>
			<td><s:date name="#request.compe.compe_endTime" format="yyyy-MM-dd"/></td>
			<td>${requestScope.compe.compe_money}</td>	
			<td>${requestScope.compe.compe_status==1?"已申请，正在审核":requestScope.compe.compe_status==2?"审核通过":requestScope.compe.compe_status==3?"竞赛已结束":requestScope.compe.compe_status==4?"竞赛已经结束":"审核未通过"}</td>	
			<td>${requestScope.compe.compe_type==1?"团体":requestScope.compe.compe_type==2?"个人":"团体/个人" }</td>
			<td>摘要</td>
			<s:if test="#request.compe.compe_program==null || #request.compe.compe_program.trim() == ''">
				<td>未上传</td>
			</s:if>
			<s:else>
				<td><a href="depManager_downloadCompeProgram?filename=${requestScope.compe.compe_program}">下载</a></td>
			</s:else>
			
		</tr>
		</table>
</div>
	</body>
</html>