<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看待审核竞赛项目</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jiao1.css">
</head>

<body>
<div class="container">
  <div class="row">

        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>查看待审核竞赛项目</p>
        </div>
        
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th style="text-align:center;">序号</th>
         <th style="text-align:center;">名称</th>
         <th style="text-align:center;">负责人</th>
         <th style="text-align:center;">院系</th>
         <th style="text-align:center;">经费</th>
         <th style="text-align:center;">方式</th>
         <th style="text-align:center;">申报时间</th>
         <th style="text-align:center;">开始时间</th>
         <th style="text-align:center;">结束时间</th>
         <th style="text-align:center;">摘要</th>
         <th style="text-align:center;">竞赛方案</th>
         <th style="text-align:center;">处理</th>
       </tr>
      </thead>
      <tbody>
        <s:iterator value="recordList" status="id">
			<tr>
				<td>${id.index+1 }</td>
				<td>${compe_compeName.compeName_name }</td>
				<td>${compe_manager }</td>
				<td>${compe_department.de_name }</td>
				<td>${compe_money }</td>
				<s:if test="compe_type == 1">
					<td>团体</td>
				</s:if>
				<s:elseif test="compe_type == 2">
					<td>个人</td>
				</s:elseif>
				<s:else>
					<td>其他</td>
				</s:else>
				
				<td><s:date name="compe_requestDate" format="yyyy-MM-dd" /></td>
				<td><s:date name="compe_startTime" format="yyyy-MM-dd" /></td>
				<td><s:date name="compe_endTime" format="yyyy-MM-dd" /></td>
				<td title="${compe_digest }">${fn:substring(compe_digest,0,5) }……</td>
				<td>
					<s:if test="compe_program == null ">
						无 
				</s:if>	
				<s:if test="compe_program != null ">
						<a href="competition_upload?inputPath=${compe_program }">下载 </a>
					</s:if>
					
					
				<td>
					
					<a href="admin_pass?id=${compe_id }">通过</a>
					<%-- <a href="admin_noPass?id=${compe_id }">未通过</a> --%>
					<a href="#" onclick="disp_prompt(${compe_id })">未通过</a>
					<a href="admin_alterCompetitionUI?id=${compe_id }">修改</a>
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
</body>
</html>

<script type="text/javascript">
	function gotoPage(pageNum){
		if(pageNum > "${pageCount}"){
			pageNum = "${pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}	
		window.location.href="admin_checkNoProject.action?&pageNum=" + pageNum;
}
	function disp_prompt(compe_id){
		var id = compe_id;
		var name = prompt("请输入未通过原因")
		var name1 = window.encodeURI(window.encodeURI(name)); 
		if (name!=null && name!=""){
			window.location.href="admin_noPass?id=" + id + "&reason="+name1;
		}
	}
</script>








<%-- <body>
<table border="1" cellpadding="1" cellspacing="0">
	<tr>
		<th>序号</th>
		<th>竞赛名称</th>
		<th>负责人</th>
		<th>院系</th>
		<th>经费</th>
		<th>参赛方式</th>
		<th>申报时间</th>
		<th>竞赛开始时间</th>
		<th>竞赛结束时间</th>
		<th>摘要</th>
		<th>竞赛方案</th>
		<th>处理</th>
	</tr>
	
	<s:iterator value="recordList" status="id">
			<tr>
				<td>${id.index+1 }</td>
				<td>${compe_compeName.compeName_name }</td>
				<td>${compe_manager }</td>
				<td>${compe_department.de_name }</td>
				<td>${compe_money }</td>
				<s:if test="compe_type == 1">
					<td>团体</td>
				</s:if>
				<s:elseif test="compe_type == 2">
					<td>个人</td>
				</s:elseif>
				<s:else>
					<td>其他</td>
				</s:else>
				
				<td><s:date name="compe_requestDate" format="yyyy-MM-dd" /></td>
				<td><s:date name="compe_startTime" format="yyyy-MM-dd" /></td>
				<td><s:date name="compe_endTime" format="yyyy-MM-dd" /></td>
				<td>${compe_digest }</td>
				<td><a href="competition_upload?inputPath=${compe_program }">${compe_program } </a></td>
				<td>
					
					<a href="admin_pass?id=${compe_id }">通过</a>
					<a href="admin_noPass?id=${compe_id }">未通过</a>
					<a href="admin_alterCompetitionUI?id=${compe_id }">修改</a>
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
		window.location.href="admin_checkNoProject.action?&pageNum=" + pageNum;
}					
</script>
</body>
</html> --%>