<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询所有获奖记录</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jiao10.css">
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>查询所有获奖记录</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>



<form action="awardRecord_conditionQuery">
<div class="container">
  <div class="row">
    <label for="inputEmail3" class="col-xs-1 control-label" style="margin-right:-4%">学院：</label>
    <div class="col-lg-1 col-md-1 col-sm-1" style="width:11%">
          <s:select cssClass="form-control" label="按学院查询" name="awardRecor_student.stu_department.de_id" list="departments" listKey="de_id" listValue="de_name" headerKey="0" headerValue="请选择学院"/>
     </div>
     <label for="inputEmail3" class="col-xs-1 control-label" style="margin-right:-4%">年度：</label>
    <div class="col-lg-1 col-md-1 col-sm-1" style="width:11%">
          <s:select cssClass="form-control" label="按年度查询" name="year" list="years" listKey="id" listValue="name"  headerKey="0" headerValue="请选择年度" />
     </div>
     <label for="inputEmail3" class="col-xs-1 control-label" style="margin-right:-4%">奖项：</label>
     <div class="col-lg-1 col-md-1 col-sm-1" style="width:13%">
          <s:select cssClass="form-control" label="按奖项查询" name="awardRecor_awadHie.awardHie_id" list="awardHieraychys" listKey="awardHie_id" listValue="awardHie_name" headerKey="0" headerValue="请选择奖项" />
     </div>
     <label for="inputEmail3" class="col-xs-1 control-label" style="margin-right:-4%">项目：</label>
     <div class="col-lg-1 col-md-1 col-sm-1" style="width:13%">
          <s:select cssClass="form-control" label="按竞赛项目查询" name="awardRecor_competition.compe_id" list="competitons" listKey="id" listValue="name"  headerKey="0" headerValue="请选择项目" />
     </div>
     <div class="col-lg-1 col-lg-offset-1 col-md-1 col-md-offset-1 col-sm-1 col-sm-offset-1">
          <input class="btn" type="submit" value="提交"/>
     </div>
     <div class="col-lg-2 col-md-2 col-sm-2">
     </div>
  </div>
</div>
</form>


<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
        <th style="text-align:center;">序号</th>
         <th style="text-align:center;">学号</th>
         <th style="text-align:center;">姓名</th>
         <!-- <th>性别</th> -->
         <th style="text-align:center;">班级</th>
         <th style="text-align:center;">院系</th>
         <th style="text-align:center;">比赛</th>
         <th style="text-align:center;">指导教师</th>
         <th style="text-align:center;">获奖等级</th>
         <th style="text-align:center;">学分</th>
         <th style="text-align:center;">学生奖金</th>
         <th style="text-align:center;">教师奖金</th>
         <th style="text-align:center;">获奖证书</th>
       </tr>
      </thead>
      <tbody>
        <s:iterator value="recordList" status="id">
        	<s:if test="awardRecor_status ==2">
        		<tr style="color:green">
        	</s:if>
        	<s:else>
				<tr>
        	</s:else>
				<s:hidden name="awardRecor_id"></s:hidden>
				<td>${id.index+1 }</td>
				<td>${awardRecor_student.stu_num }</td>
				<td>${awardRecor_student.stu_name }</td>
				<%-- <td>${awardRecor_student.stu_sex }</td> --%>
				<td>${awardRecor_student.stu_class }</td>
				<td>${awardRecor_student.stu_department.de_name }</td>
				<td><s:date name="awardRecor_time" format="yyyy年" />${awardRecor_competition.compe_compeName.compeName_name }</td>
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
				<%-- <td><s:date name="awardRecor_time" format="yyyy-MM-dd" /></td> --%>
				<td>${awardRecor_score }</td>
				<td>${awardRecor_stuMoney }</td>
				<td>${awardRecor_teaMoney }</td>
				<td>
				<s:if test="awardRecor_picturePath == null | awardRecor_picturePath ==''">
				未上传
				</s:if>
				<s:else>
					<a class="image-icon" rel="gallery[modal]" href="${awardRecor_picturePath }">
					<img height="20" width="50" src="${awardRecor_picturePath }"></a>
					<%-- <img alt="" src="${awardRecor_picturePath }"> --%>
				</s:else>
				</td>
			</tr>
	</s:iterator>
       
      </tbody>
    </table>
</div>


<div class="container">
  <div class="row">
   <div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-4 col-xs-5 col-xs-offset-4">
           <p class="xixnxi">每页显示${pageSize }条，总记录数${recordCount }条</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
           <nav>
          <ul class="pagination">
            </li>
            <li><a href="javascript:gotoPage(1)">首页</a></li>
            <li><a href="javascript:gotoPage(${pageNum }-1)">上一页</a></li>
            <li><a href="#">${currentPage }/${pageCount }</a></li>
            <li><a href="javascript:gotoPage(${pageNum }+1)">下一页</a></li>
            <li><a href="javascript:gotoPage(${pageCount })">尾页</a></li>
            </li>
          </ul>
        </nav>
        </div>
      </div>
</div>
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	
	
	function gotoPage(pageNum){
		if(pageNum > "${pageCount}"){
			pageNum = "${pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}
		
		var url = display_alert();
		//alert("456")
		window.location.href="awardRecord_conditionQuery.action?&pageNum=" + pageNum + url;
	}
	
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


<head>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 begin -->
<script type='text/javascript' src='ly/js/jquery.js'></script>
<script type='text/javascript' src='ly/js/jquery.scripts.js'></script>
<script type='text/javascript' src='ly/js/jquery.custom.js'></script>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 end -->
<link rel="stylesheet" type="text/css" media="all" href="ly/css/style.min.css" />
</head>





<%-- 



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
<s:select label="按年度" name="awardRecor_id" list="awardRecords" listKey="awardRecor" listValue="awardRecor_time" headerKey="0" headerValue="请选择"/>
<s:select label="年度" name="awardRecor_time" list="year" listKey="key" listValue="value" headerKey="0" headerValue="请选择" /> 
<s:select label="按年度查询" name="list" list="year" headerKey="0" headerValue="请选择" />
<s:select id="year" label="按年度查询" name="year" list="years" listKey="id" listValue="name"  headerKey="0" headerValue="请选择" />

按奖项查询：      
<s:select id="awardHie" label="按奖项查询" name="awardRecor_awadHie.awardHie_id" list="awardHieraychys" listKey="awardHie_id" listValue="awardHie_name" headerKey="0" headerValue="请选择" />
按竞赛项目查询：      
<s:select label="按竞赛项目查询" name="awardRecor_competition.compe_id" list="competitons" listKey="compe_id" listValue="compe_compeName.compeName_name"  headerKey="0" headerValue="请选择" />
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
	<s:iterator value="awardRecords" status="id">
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
				<s:if test="awardRecor_team ==null ">
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
				</s:else>
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
					<img alt="" src="${awardRecor_picturePath }">
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

<script language="javascript">
if(typeof jQuery == 'undefined'){
    window.alert("没有jquery");
}
</script>

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
</html> --%>