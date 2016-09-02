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
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/xueyuan1-2.css"/>
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<%-- <script type="text/javascript" src="<%=basePath %>JQueryResources/fixError.js"></script> --%>
</head>
<body>
<div class="dangqian">
    		<div class="row">
		        <!-- <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
		            <a> <p>  </p> </a>
		        </div> -->
		        <div class="col-lg-2 col-lg-offset-6 col-md-3 col-md-offset-3 col-xs-5  col-xs-offset-1">
		            <p>当前位置：学院负责人>>选择下级比赛</p>
		        </div>
		        <div class="col-lg-2 col-md-3 col-xs-3">
		            <p>欢迎 	${sessionScope.depManager.depM_name }  登录本系统</p>
		        </div>
    		</div>
		</div>
<div class="container">
	<table class="table table-striped table-bordered table-hover">
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
	</div>
</body>
</html>