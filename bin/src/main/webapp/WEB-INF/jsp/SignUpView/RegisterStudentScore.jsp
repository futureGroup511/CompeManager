<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
		<thead>
			<tr>
			  <th>学生所在院系</th>
			  <th>学生所在班级</th>
              <th>学生学号</th>
              <th>学生姓名</th>
              <th>指导老师</th>
              <th>竞赛名称</th>
              <th>所加学分</th>
              <th>获奖等级</th>
              <th></th>
          </tr>
		</thead>
		<s:if test="#request.signUp != null">
				<tr>
					<td><s:property value="#request.signUp.signUp_student.stu_department.de_name"/></td>
					<td><s:property value="#request.signUp.signUp_student.stu_class"/></td>
					<td><s:property value="#request.signUp.signUp_student.stu_num"/></td>
					<td><s:property value="#request.signUp.signUp_student.stu_name"/></td>
					<td><s:property value="#request.signUp.signUp_teacher"/></td>
					<td><s:property value="#request.signUp.signUp_competition.compe_compeName.compeName_name"/></td>
					<s:form action="depManager_registerScoreToRecord" method="post">
						<td><s:textfield name="ScoreAdded"></s:textfield></td>
						<td><s:select name="awardHieId" list="#request.hieList" listKey="awardHie_id" listValue="awardHie_name"></s:select></td>
						<s:hidden name="registerSignUpId" value="%{#request.signUp.signUp_id }"></s:hidden>
						<s:hidden name="groupIsOrNot" value="%{#request.groupIsOrNot }"></s:hidden>
						<s:hidden name="currentPage" value="%{#request.currentPage }"></s:hidden>
						<td><s:submit value="提交"></s:submit></td>
					</s:form>
				</tr>
		</s:if>
		<s:else>
			<tr>
				<td colspan="9">
					没有需要录入成绩的信息
				</td>
			</tr>
		</s:else>
	</table>
</body>
</html>