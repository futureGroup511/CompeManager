
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>
</head>
<body>
	<s:if test="#session.stu!=null">
		你好,${sessionScope.stu.stu_name} <a href="loginControll_loginOut">退出</a>
	</s:if>
	<s:elseif test="#session.depManager!=null">
		你好,${sessionScope.depManager.depM_name} <a href="loginControll_loginOut">退出</a>
	</s:elseif>
	<s:elseif test="#session.admin!=null">
		你好,${sessionScope.admin.ad_name} <a href="loginControll_loginOut">退出</a>
	</s:elseif>
	<s:else>
		<a href="loginControll_loginView">登陆</a>
	</s:else>
	<s:form method="post" action="depManager_login">
		<s:textfield name="depM_num"/>
		<s:textfield name="depM_password"/>
		<s:submit value="提交"></s:submit>
	</s:form>
	<a href="student_loginView.action">学生登陆</a>

	<a href="admin_loginView.action">教务处</a>
	<a href="depManager_sendInformView">发布通知</a>
	<a href="depManager_lookInformView">查看通知</a>	
	<a href="admin_findAll">查看所有学院负责人</a>
	<a href="admin_addDeparmentManegerView">添加学院负责人</a>
	<a href="admin_findAllStudent">查看所有学生</a>
	<a href="admin_finAllDepartment">查看所有学院</a>
	<a href="admin_addDepartmentView">添加学院</a>
	<a href="comphier_findAllcomphier">查看所有竞赛等级</a>
	<a href="admin_addCompetitionHierarchyView">添加竞赛等级</a>
	<a href="awardhierar_findAll">查看所有获奖等级</a>
	<a href="admin_addAwardHierarchyView">添加获奖等级</a>
	<a href="awardstand_findAll">查看所有奖励标准</a>
	<a href="admin_addAwardStandView">添加奖励标准</a>
</body>
</html>



