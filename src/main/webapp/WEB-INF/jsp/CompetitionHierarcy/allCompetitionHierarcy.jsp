<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所有竞赛等级</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jietu6.css">
</head>

<body>

<div class="container">
  <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>查看所有竞赛等级</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-3 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-lg-2 col-lg-offset-2 col-md-2 col-md-offset-2 col-xs-2">
            <a href="admin_addCompetitionHierarchyView"><p>添加竞赛等级</p></a>
    </div>
   </div>
</div>


<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th style="text-align:center">序号</th>
         <th style="text-align:center">竞争等级</th>
         <th style="text-align:center">描述</th>
         <th style="text-align:center">修改</th>
       </tr>
      </thead>
      <tbody>
        <c:forEach items="${ps.recordlist}" varStatus="status" var="comph">
			<tr>
			   	<th>${status.index+1}</th>
				<th>${comph.compeHie_name}</th>
				<th>${comph.compeHie_descr }</th>
				<th><a href="comphier_modifyCompHierarchy?compeHie_id=${comph.compeHie_id}">修改</a></th>
			</tr>
		</c:forEach>
       
       </tbody>
      </table>
</div>
<div class="container">
  <div class="row">
   <div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-4 col-xs-5 col-xs-offset-4">
           <p class="xixnxi">每页显示${ps.pageSize }条，总记录数${ps.recordCount }条</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
           <nav>
          <ul class="pagination">
            <li><a href="javascript:gotoPage(1)">首页</a></li>
            <li><a href="javascript:gotoPage(${ps.currentPage }-1)">上一页</a></li>
            <li><a href="#">${ps.currentPage }/${ps.pageCount }</a></li>
            <li><a href="javascript:gotoPage(${ps.currentPage }+1)">下一页</a></li>
            <li><a href="javascript:gotoPage(${ps.pageCount })">尾页</a></li>
          </ul>
        </nav>
        </div>
      </div>
</div>
</body>
<script type="text/javascript">
	function gotoPage(pageNum){
		if(pageNum > "${ps.pageCount}"){
			pageNum = "${ps.pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}	
		window.location.href="comphier_findAllcomphier?currentPage=" + pageNum;
}					
</script>
</html>











<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看所有竞赛等级</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<a href="admin_addCompetitionHierarchyView">添加竞赛等级</a>
	<table class="table table-bordered table-hover">
		<thead>
				<tr>
					<th>#</th>
					<th>竞赛等级</th>
					<th>修改</th>
				</tr>
		</thead>
		<tbody>
				<c:forEach items="${ps.recordlist}" varStatus="status" var="comph">
					<tr>
					   	<th>${status.index+1}</th>
						<th>${comph.compeHie_name}</th>
						<th>${comph.compeHie_descr }</th>
						<th><a href="comphier_modifyCompHierarchy?compeHie_id=${comph.compeHie_id}">修改</a></th>
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<div class="center-block" style="width:500px">
			<ul class="pagination">
			<s:if test="#request.ps.currentPage-1 <= 0">
				<li><a href="${pageContext.request.contextPath}/comphier_findAllcomphier?currentPage=1"><span>&laquo;</span></a></li>
			</s:if>
			<s:elseif test="#request.ps.currentPage-1 >= 1">
				<li><a href="${pageContext.request.contextPath}/comphier_findAllcomphier?currentPage=${ps.currentPage-1}"><span>&laquo;</span></a></li>				
			</s:elseif>
			<c:forEach begin="1" end="${request.ps.pageCount}" varStatus="sta">
				<li><a href="${pageContext.request.contextPath}/comphier_findAllcomphier?currentPage=${ps.beginPageIndex+sta.index-1}">${ps.beginPageIndex+sta.index-1}</a></li>	
			</c:forEach>
			
			<s:if test="#request.ps.currentPage+1 > #request.ps.pageCount">
				<li><a href="${pageContext.request.contextPath}/comphier_findAllcomphier?currentPage=${ps.pageCount}"><span>&raquo;</span></a></li>	
			</s:if>
			<s:elseif test="#request.ps.currentPage+1 <= #request.ps.pageCount">
				<li><a href="${pageContext.request.contextPath}/comphier_findAllcomphier?currentPage=${ps.currentPage+1}"><span>&raquo;</span></a></li>				
			</s:elseif>
			
			</ul>
	</div>
</body>
</html> --%>