<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核成功竞赛名称</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jiao5.css">
<script type="text/javascript" src="JQueryResources/jquery-2.1.4.js"></script>
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>查看审核成功竞赛名称</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-lg-8 col-lg-offset-4">
       <p></p>
    </div>
  </div>
</div>
<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th style="text-align:center;">序号</th>
         <th style="text-align:center;">竞赛名称</th>
         <th style="text-align:center;">级别</th>
         <th style="text-align:center;">描述</th>
       </tr>
      </thead>
      <tbody>
        <s:iterator value="recordList" status="id">
			<tr>
				<td>${id.index+1 }</td>
				<td>${compeName_name }</td>
				<td>${compeName_compeHierarchy.compeHie_name }</td>
				<td title="${compeName_descr }">${fn:substring(compeName_descr,0,30) }……</td>
				<%-- <td><abbr title="${compeName_descr }">${fn:substring(compeName_descr,0,30) }……</abbr></td> --%>
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
            <li><a href="javascript:gotoPage(1)">首页</a></li>
            <li><a href="javascript:gotoPage(${pageNum }-1)">上一页</a></li>
            <li><a href="#">${currentPage }/${pageCount }</a></li>
            <li><a href="javascript:gotoPage(${pageNum }+1)">下一页</a></li>
            <li><a href="javascript:gotoPage(${pageCount })">尾页</a></li>
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
		window.location.href="competitionName_checkSuccessName.action?&pageNum=" + pageNum;
	}					
</script>
<script type="text/javascript">
	$(function(){
		var td = $(".td").text();
		var td1 = td.substring(0,25)+"……";
		//alert(td1);
		$(".td").text(td1);
	})
</script>
</body>
</html>





<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核成功竞赛名称</title>
</head>
<body>
审核成功竞赛名称
<table border="1" cellpadding="1" cellspacing="0">
	<tr>
		<th>序号</th>
		<th>竞赛名称</th>
		<th>级别</th>
		<th>描述</th>
	</tr>
	<s:iterator value="recordList" status="id">
			<tr>
				<td>${id.index+1 }</td>
				<td>${compeName_name }</td>
				<td>${compeName_compeHierarchy.compeHie_name }</td>
				<td>${compeName_descr }</td>
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
		window.location.href="competitionName_checkSuccessName.action?&pageNum=" + pageNum;
}					
</script>
</body>
</html> --%>