<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加获奖单位以及修改时间</title>
<script type="text/javascript" src="JQueryResources/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/JQueryResources/laydate/laydate.js"></script>
<script type='text/javascript' src='ly/js/jquery.js'></script>
<script type='text/javascript' src='ly/js/jquery.scripts.js'></script>
<script type='text/javascript' src='ly/js/jquery.custom.js'></script>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 end -->
<link rel="stylesheet" type="text/css" media="all" href="ly/css/style.min.css" />
</head>
<body>
id:<s:textfield name="awardRecor_student.stu_id" disabled="true" /><br>
学号：<s:textfield name="awardRecor_student.stu_num" disabled="true" /><br>
姓名：<s:textfield name="awardRecor_student.stu_name" disabled="true" /><br>
性别：<s:textfield name="awardRecor_student.stu_sex" disabled="true" /><br>
班级：<s:textfield name="awardRecor_student.stu_class" disabled="true" /><br>
院系：<s:textfield name="awardRecor_student.stu_department.de_name" disabled="true" /><br>

竞赛：<br>
竞赛id：<s:textfield name="awardRecor_competition.compe_id" disabled="true" /><br>
竞赛名称：<s:textfield name="awardRecor_competition.compe_compeName.compeName_name" disabled="true" /><br>

<br>
指导老师：<s:textfield name="awardRecor_coachTeacher" disabled="true" /><br>
是否为负责人：<s:textfield name="awardRecor_manager" disabled="true" /><br>
团队名称：<s:textfield name="awardRecor_team" disabled="true"/><br>
证书：<a class="image-icon" rel="gallery[modal]" href="${awardRecor_picturePath }">
	<img height="20" width="100" src="${awardRecor_picturePath }"></a>


<br>
<br>
<br>
<br>
id:<s:textfield name="awardRecor_id" disabled="true" /><br>
获奖等级：
<%-- <s:textfield name="awardRecor_awadHie.awardHie_id" />此处为一个对象<br> --%> 
<s:select cssClass="form-control" label="按奖项查询" name="awardRecor_awadHie.awardHie_id" list="awardHieraychys" listKey="awardHie_id" listValue="'(' + awardHie_descr+ ')' + awardHie_name" headerKey="%{awardRecor_awadHie.awardHie_id }" headerValue="%{awardRecor_awadHie.awardHie_name }" /><br>



学分：<s:textfield name="awardRecor_score" disabled="true"/><br>
奖金：<s:textfield name="awardRecor_stuMoney" disabled="true"/><br>
老师奖金：<s:textfield name="awardRecor_teaMoney" disabled="true"/><br>
获奖日期：<%-- <s:textfield name="<s:date name='awardRecor_time' format='yyyy-MM-dd' />" /> --%>
<input class="form-control" type="text" name=awardRecor_time onclick="laydate()" value="<s:date name='awardRecor_time' format='yyyy-MM-dd' />">
<br>
发奖单位：<s:textfield name="awardRecor_unit" /><br>




</body>
<script type="text/javascript">
	$(function(){
		alert("12313");
	})
</script>
</html>