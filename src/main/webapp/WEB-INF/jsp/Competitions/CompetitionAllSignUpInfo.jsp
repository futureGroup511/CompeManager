<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>竞赛报名所有学生信息</title>
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
          </tr>
		</thead>
		<s:if test="#request.pageBean.recordList != null && #request.pageBean.recordList.size() >0">
			<s:iterator value="#request.pageBean.recordList" var="signUp">
				<tr>
					<td><s:property value="#signUp.signUp_student.stu_department.de_name"/></td>
					<td><s:property value="#signUp.signUp_student.stu_class"/></td>
					<td><s:property value="#signUp.signUp_student.stu_num"/></td>
					<td><s:property value="#signUp.signUp_student.stu_name"/></td>
					<td><s:property value="#signUp.signUp_teacher"/></td>
					<td><s:property value="#signUp.signUp_competition.compe_compeName.compeName_name"/></td>
				</tr>
			</s:iterator>
				<tr>
					<td></td>
	      			<td><a href="depManager_seeSignUpsDetails?currentPage=0&compeId=${compeId }">首页</a></td>
	      			<td><a href="depManager_seeSignUpsDetails?currentPage=${currentPage-1<0?0:currentPage-1}&compeId=${compeId }">上一页</a></td>
	      			<td><a href="depManager_seeSignUpsDetails?currentPage=${currentPage+1>requestScope.pb.pageCount?requestScope.pb.pageCount:currentPage+1}&compeId=${compeId }">下一页</a></td>
	      			<td><a href="depManager_seeSignUpsDetails?currentPage=${requestScope.pb.pageCount }&compeId=${compeId }">尾页</a></td>
	      			<td></td>
      			</tr>
		</s:if>
		<s:else>
			<tr>
				<td colspan="6">
					没有需要录入成绩的信息
				</td>
			</tr>
		</s:else>
	</table>
</body>
</html>