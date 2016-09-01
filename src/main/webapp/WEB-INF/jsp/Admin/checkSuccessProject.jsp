<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核成功核竞赛项目</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jiao2.css">
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
            <a><p></p></a>
        </div>
        <div class="col-lg-2 col-lg-offset-6 col-md-3 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：教务处服务>>查看正在进行竞赛</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
  </div>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th>序号</th>
         <th>竞赛名称</th>
         <th>负责人</th>
         <th>院系</th>
         <th>经费</th>
         <th>方式</th>
         <th>申报时间</th>
         <th>开始时间</th>
         <th>结束时间</th>
         <th>摘要</th>
         <th>竞赛方案</th>
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
				<td>${compe_digest }</td>
				<td><a href="competition_upload?inputPath=${compe_program }">单击下载</a></td>
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
            <li><a href="#">	${currentPage }/${pageCount }</a></li>
            <li><a href="javascript:gotoPage(${pageNum }+1)">下一页</a></li>
            <li><a href="javascript:gotoPage(${pageCount })">尾页</a></li>
            </li>
          </ul>
        </nav>
        </div>
      </div>
</div>
<script type="text/javascript">
	function gotoPage(pageNum){
		if(pageNum > "${pageCount}"){
			pageNum = "${pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}	
		window.location.href="admin_checkSuccessProject.action?&pageNum=" + pageNum;
}					
</script>
</body>
</html>











<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核成功核竞赛项目</title>
</head>
<body>
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
		window.location.href="admin_checkSuccessProject.action?&pageNum=" + pageNum;
}					
</script>

</body>
</html> --%>