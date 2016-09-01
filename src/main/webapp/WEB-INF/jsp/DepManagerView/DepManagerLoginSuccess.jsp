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
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>css/xueyuan5.css" />
<script src="<%=basePath %>js/jquery-3.0.0.min.js"></script>
<script src="<%=basePath %>js/bootstrap.js"></script>
</head>
<body>
		<div class="dangqian">
    		<div class="row">
		        <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
		            <a> <p>  </p> </a>
		        </div>
		        <div class="col-lg-2 col-lg-offset-6 col-md-3 col-md-offset-3 col-xs-5  col-xs-offset-1">
		            <p>当前位置：学院负责人>>登陆成功</p>
		        </div>
		        <div class="col-lg-2 col-md-3 col-xs-3">
		            <p>欢迎 	${sessionScope.depManager.depM_name }  登录本系统</p>
		        </div>
    		</div>
		</div>
	<div class="container">
	<ul>
		<li><a href="depManager_lookProcessingCompetitionStatus">查看正在进行项目的报名情况</a></li>
		<li><a href="depManager_applyCompeName">申报项目名称</a></li>
		<li><a href="depManager_seeAllApplyCompNames">查看申报项目名称审核状态</a></li>
		<li><a href="depManager_applyCompetitionPage">申报项目</a></li>
		<li><a href="depManager_seeAllApplyCompetition">查看申报项目审核状态</a></li>
		<!-- <li><a href="depManager_seeHistoryCompetition">历史申报项目</a></li> -->
		<li><a href="depManager_inspectStudentApplyPage">审核报名</a></li>
		<li><a href="depManager_nextClassCompetition">继续下级比赛</a></li>
	</ul>
			
				<s:if test="#request.compeList != null && #request.compeList.size() > 0">
					<s:form action="depManager_registerScore">
					<div class="row">
              		 <div class="col-lg-4 col-md-4 col-xs-5">
						<select name="compeId">
							<s:iterator value="#request.compeList" var="compe">
								<option value="<s:property value="#compe.compe_id" />"><s:date name="#compe.compe_requestDate" format="yyyy-MM-dd"/> 申请的 ${compe.compe_compeName.compeName_name}</option>
							</s:iterator>
						</select>
						</div>
						</div>
						<s:radio list="#{'1':'团体', '2':'个人' }" name="signType" value="1">
						</s:radio>
						<s:submit value="录入此竞赛成绩"></s:submit>
					</s:form>
				</s:if>
				<s:else>
					暂无竞赛结果需要填写
				</s:else>
</div>
</body>
</html>