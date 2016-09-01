<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>待审核竞赛名称</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jiao4.css">
</head>

<body>
<div class="container">
  <div class="row">
     <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
            <a><p></p></a>
        </div>
        <div class="col-lg-2 col-lg-offset-6 col-md-3 scol-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：教务处服务>>查看待审核竞赛名称</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎登录本系统</p>
        </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-lg-8 col-lg-offset-4">
       <p>待审核项目名称</p>
    </div>
  </div>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th>序号</th>
         <th>竞赛名称</th>
         <th>级别</th>
         <th>描述</th>
         <th>操作</th>
       </tr>
      </thead>
      <tbody>
        <s:iterator value="recordList" status="id">
			<tr>
				<td>${id.index+1 }</td>
				<td>${compeName_name }</td>
				<td>${compeName_compeHierarchy.compeHie_name }</td>
				<td>${compeName_descr }</td>
				<td>
					<a href="competitionName_pass?id=${compeName_id }">通过</a>
					<a href="competitionName_noPass?id=${compeName_id }">未通过</a>
					<a href="competitionName_alterCompetitionNameUI?id=${compeName_id }">修改</a>
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
<script type="text/javascript">
	function gotoPage(pageNum){
		if(pageNum > "${pageCount}"){
			pageNum = "${pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}	
		window.location.href="competitionName_checkNoName.action?&pageNum=" + pageNum;
}					
</script>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>待审核竞赛名称</title>
</head>
<body>
待审核项目名称
<table border="1" cellpadding="1" cellspacing="0">
	<tr>
		<th>序号</th>
		<th>竞赛名称</th>
		<th>级别</th>
		<th>描述</th>
		<th>操作</th>
	</tr>
	<s:iterator value="recordList" status="id">
			<tr>
				<td>${id.index+1 }</td>
				<td>${compeName_name }</td>
				<td>${compeName_compeHierarchy.compeHie_name }</td>
				<td>${compeName_descr }</td>
				<td>
					<a href="competitionName_pass?id=${compeName_id }">通过</a>
					<a href="competitionName_noPass?id=${compeName_id }">未通过</a>
					<a href="competitionName_alterCompetitionNameUI?id=${compeName_id }">修改</a>
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
		window.location.href="competitionName_checkNoName.action?&pageNum=" + pageNum;
}					
</script>
</body>
</html> --%>