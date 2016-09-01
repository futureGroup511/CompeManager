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
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>css/xueyuan4.css"/>
</head>
<body>
<div class="dangqian">
    		<div class="row">
		        <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
		            <a> <p>  </p> </a>
		        </div>
		        <div class="col-lg-2 col-lg-offset-6 col-md-3 col-md-offset-3 col-xs-5  col-xs-offset-1">
		            <p>当前位置：学院负责人>>申请竞赛名称</p>
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
			  <th>学生所在院系</th>
			  <th>学生所在班级</th>
              <th>学生学号</th>
              <th>学生姓名</th>
              <th>指导老师</th>
              <th>竞赛名称</th>
              <s:if test="#request.isGroup">
	              <th>团队名称</th>
    	          <th>是否为团队负责人</th>
              </s:if>
              <th>录入成绩</th>
          </tr>
		</thead>
		<s:if test="#request.signUpList != null && #request.signUpList.size() > 0">
			<s:iterator value="#request.signUpList" var="signUp">
				<tr>
					<td><s:property value="#signUp.signUp_student.stu_department.de_name"/></td>
					<td><s:property value="#signUp.signUp_student.stu_class"/></td>
					<td><s:property value="#signUp.signUp_student.stu_num"/></td>
					<td><s:property value="#signUp.signUp_student.stu_name"/></td>
					<td><s:property value="#signUp.signUp_teacher"/></td>
					<td><s:property value="#signUp.signUp_competition.compe_compeName.compeName_name"/></td>
					<s:if test="#request.isGroup">
						<td><s:property value="#signUp.signUp_team"/></td>
						<td><s:property value="#signUp.singUp_manager==0?'不是':'是'"/></td>
					</s:if>
					<td><a href="depManager_registerScoreToPage?registerSignUpId=${signUp.signUp_id }&groupIsOrNot=${request.isGroup }&currentPage=${request.currentPage}">录入成绩</a></td>
				</tr>
			</s:iterator>
		</s:if>
		<s:else>
			没有需要录入成绩的信息
		</s:else>
	</table>
	</div>
</body>
</html>