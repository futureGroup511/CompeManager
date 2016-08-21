<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核报名</title>
</head>
<body>
<table style="font-size:12px;">
      <thead>
          <tr>
              <th>指导老师</th>
              <th>所报竞赛类型</th>
              <th>团队名称</th>
              <th>是否为团队负责人</th>
              <th>审核状态</th>
              <th>报名时间</th>
              <th>学生院系</th>
              <th>学生班级</th>
              <th>学生姓名</th>
              <th>学生学号</th>
              <th>所报竞赛名称</th>
              <th>审核通过</th>
              <th>审核不通过</th>
              <th>指定为负责人</th>
          </tr>
      </thead>
      <tbody>
      	<s:if test="#request.pb == null || #request.pb.recordList.size() == 0">
      		<tr>
      			<td colspan="8">当前没有竞赛信息！！！！！</td>
      		</tr>
      	</s:if>
      	<s:else>
      		<s:iterator value="#request.pb.recordList" var="signUp">
      			<tr>
      				<td>${signUp.signUp_teacher}</td>
      				<td>${signUp.singnup_type==1?"团体":"个人" }</td>
      				<td>${signUp.singnup_type==1?signUp.signUp_team:"无" }</td>
      				<td>${signUp.singnup_type==2?"无":signUp.singUp_manager==1?"是":"否"}</td>
      				<td>${signUp.signUp_status==1?"已报名":signUp.signUp_status==2?"审核通过":"审核未通过"}</td>	
      				<td><s:date name="#signUp.signUP_time" format="yyyy-MM-dd"/></td>
      				<td>${signUp.signUp_student.stu_department.de_name}</td>	
      				<td>${signUp.signUp_student.stu_class}</td>
      				<td>${signUp.signUp_student.stu_name}</td>	
      				<td>${signUp.signUp_student.stu_num}</td>
      				<td>${signUp.signUp_competition.compe_compeName.compeName_name}</td>
      				<td>
      					<s:if test="#signUp.signUp_status==1">
	      					<a href="depManager_inspectSuccess?signId=${signUp.signUp_id }&currentPage=${requestScope.pb.currentPage}">我要审核</a>
      					</s:if>
      					<s:else>
      						${signUp.signUp_status==2?"已审核通过":"审核未通过"}
      					</s:else>
      				</td>
      				<td>
      					<s:if test="#signUp.signUp_status==2">
	      					<a href="depManager_inspectFailure?signId=${signUp.signUp_id }&currentPage=${requestScope.pb.currentPage}">禁止通过</a>
      					</s:if>
      					<s:elseif test="#signUp.signUp_status==1">
	      					待审核状态
      					</s:elseif>
      					<s:else>
      						已禁止通过
      					</s:else>
      				</td>
      				<td>
      					<s:if test="#signUp.singUp_manager==1">
							已是负责人
      					</s:if>
      					<s:elseif test="#signUp.signUp_status==3">
      						审核未通过
      					</s:elseif>
      					<s:elseif test="#signUp.singnup_type==2">
      						个人赛无需指定负责人
      					</s:elseif>
      					<s:elseif test="#signUp.singUp_manager==0">
      						<a href="depManager_inspectToTeamLeader?signId=${signUp.signUp_id }&teamName=${signUp.signUp_team }&currentPage=${requestScope.pb.currentPage}">指定为负责人</a>
      					</s:elseif>
      				</td>	
      			</tr>
      		</s:iterator>
      		<tr>
      			<td><a href="depManager_inspectStudentApplyPage?currentPage=0">首页</a></td>
      			<td><a href="depManager_inspectStudentApplyPage?currentPage=${currentPage-1<0?0:currentPage-1}">上一页</a></td>
      			<td><a href="depManager_inspectStudentApplyPage?currentPage=${currentPage+1>requestScope.pb.pageCount?requestScope.pb.pageCount:currentPage+1}">下一页</a></td>
      			<td><a href="depManager_inspectStudentApplyPage?currentPage=${requestScope.pb.pageCount }">尾页</a></td>
      		</tr>
      	</s:else>
      </tbody>
</table>
</body>
</html>