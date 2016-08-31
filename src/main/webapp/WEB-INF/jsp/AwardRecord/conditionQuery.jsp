<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询所有获奖记录</title>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 begin -->
<script type='text/javascript' src='ly/js/jquery.js'></script>
<script type='text/javascript' src='ly/js/jquery.scripts.js'></script>
<script type='text/javascript' src='ly/js/jquery.custom.js'></script>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 end -->
<link rel="stylesheet" type="text/css" media="all" href="ly/css/style.min.css" />

</head>
<body>

<form action="awardRecord_conditionQuery">
按学院查询： 
<s:select id ="department" label="按学院查询" name="awardRecor_student.stu_department.de_id" list="departments" listKey="de_id" listValue="de_name" headerKey="0" headerValue="请选择"/>
按年度查询：        
<%-- <s:select label="按年度" name="awardRecor_id" list="awardRecords" listKey="awardRecor" listValue="awardRecor_time" headerKey="0" headerValue="请选择"/> --%>
<%-- <s:select label="年度" name="awardRecor_time" list="year" listKey="key" listValue="value" headerKey="0" headerValue="请选择" /> --%> 
<%-- <s:select label="按年度查询" name="list" list="year" headerKey="0" headerValue="请选择" /> --%>
<s:select id="year" label="按年度查询" name="year" list="years" listKey="id" listValue="name"  headerKey="0" headerValue="请选择" />

按奖项查询：      
<s:select id="awardHie" label="按奖项查询" name="awardRecor_awadHie.awardHie_id" list="awardHieraychys" listKey="awardHie_id" listValue="awardHie_name" headerKey="0" headerValue="请选择" />
按竞赛项目查询：      
<%-- <s:select label="按竞赛项目查询" name="awardRecor_competition.compe_id" list="competitons" listKey="compe_id" listValue="compe_compeName.compeName_name"  headerKey="0" headerValue="请选择" /> --%>
<s:select id="competition" label="按竞赛项目查询" name="awardRecor_competition.compe_id" list="competitons" listKey="id" listValue="name"  headerKey="0" headerValue="请选择" />
<input type="submit" value="提交" />
</form>


<table border="1" cellpadding="1" cellspacing="0">
	<tr>
		<th>序号</th>
		<th>学号</th>
		<th>姓名</th>
		<th>性别</th>
		<th>班级</th>
		<th>院系</th>
		<th>获奖比赛</th>
		<th>指导老师</th>
		<!-- <th>团队名称</th>
		<th>是否为负责人</th> -->
		<th>获奖等级</th>
		<th>获奖日期</th>
		<th>所加学分</th>
		<th>所获奖金</th>
		<th>指导老师所获奖金</th>
		<th>获奖证书</th>
	</tr>
	<%-- <s:iterator value="awardRecords" status="id"> --%>
	<s:iterator value="recordList" status="id">
			<tr>
				<s:hidden name="awardRecor_id"></s:hidden>
				<td>${id.index+1 }</td>
				<td>${awardRecor_student.stu_num }</td>
				<td>${awardRecor_student.stu_name }</td>
				<td>${awardRecor_student.stu_sex }</td>
				<td>${awardRecor_student.stu_class }</td>
				<td>${awardRecor_student.stu_department.de_name }</td>
				<td>${awardRecor_competition.compe_compeName.compeName_name }</td>
				<td>${awardRecor_coachTeacher }</td>
				<%-- <s:if test="awardRecor_team ==null ">
					<td>----------</td>
					<td>----------</td>
				</s:if>
				<s:else>
					<td>${awardRecor_team }</td>
					
					<s:if test="awardRecor_manager == 1">
						<td>是</td>
					</s:if>
					<s:else>
						<td>否</td>
					</s:else>
				</s:else> --%>
				<td>${awardRecor_awadHie.awardHie_name }</td>
				<td><s:date name="awardRecor_time" format="yyyy-MM-dd" /></td>
				<td>${awardRecor_score }</td>
				<td>${awardRecor_stuMoney }</td>
				<td>${awardRecor_teaMoney }</td>
				<td>
				<s:if test="awardRecor_picturePath == ''">
				未上传
				</s:if>
				<s:else>
					<a class="image-icon" rel="gallery[modal]" href="${awardRecor_picturePath }">
					<img height="20" width="100" src="${awardRecor_picturePath }"></a>
					<%-- <img alt="" src="${awardRecor_picturePath }"> --%>
				</s:else>
				</td>
			</tr>
	</s:iterator>
</table>

<div style="float:center;">
	每页显示${pageSize }条，总记录数${recordCount }条
	<a href="javascript:gotoPage(1)">首页</a>
	<a href="javascript:gotoPage(${pageNum }-1)">上一页</</a>
	${currentPage }/${pageCount }
	<a href="javascript:gotoPage(${pageNum }+1)">下一页</</a>
	<a href="javascript:gotoPage(${pageCount })">尾页</a>
</div>
            
<script type="text/javascript">
	function gotoPage(pageNum){
		if(pageNum > "${pageCount}"){
			pageNum = "${pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}
		
		var url = display_alert();
		window.location.href="awardRecord_conditionQuery.action?&pageNum=" + pageNum + url;
}
	
	
</script>

<%-- <script language="javascript">
if(typeof jQuery == 'undefined'){
    window.alert("没有jquery");
}
</script> --%>

<script type="text/javascript">
function display_alert(url)
  {

	//从document对象中，获取select标签
	var a = document.getElementById("department").value;
	//select标签获取的值其实是一个数组--a.options[]; 然后，选定项的下标是--a.selectedIndex
	//var a1=a.options[a.selectedIndex].value;
	//alert(a);
	
	var b = document.getElementById("year").value;
	//alert(b);
	
	var c = document.getElementById("awardHie").value;
	//alert(c);
	
	var d = document.getElementById("competition").value;
	//alert(d);
	
	var url= "&awardRecor_student.stu_department.de_id="+a+"&year="+b+"&awardRecor_awadHie.awardHie_id="+c+"&awardRecor_competition.compe_id="+d;
	//alert(url)
	return url;
  }
</script>
</body>
</html>