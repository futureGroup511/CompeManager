<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看竞赛审核转台</title>
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>css/xueyuan4.css"/>
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<%-- <script type="text/javascript" src="<%=basePath %>JQueryResources/fixError.js"></script> --%>
</head>
<body>
<div class="dangqian">
    		<div class="row">
		        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
		            <p>当前位置：学院负责人>>竞赛审核状态</p>
		        </div>
		        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
		            <p>欢迎 	${sessionScope.depManager.depM_name }  登录本系统</p>
		        </div>
    		</div>
		</div>
<div class="container">		
 <table class="table table-striped table-bordered table-hover">
      <thead>
          <tr>
             <td align="center"><h4>竞赛负责人</h4></td>
             <td align="center"><h4>竞赛申报时间</h4></td>
             <td align="center"><h4>竞赛开始时间</h4></td>
             <td align="center"><h4>竞赛结束时间</h4></td>
             <td align="center"><h4>竞赛经费</h4></td>
             <td align="center"><h4>竞赛申报学院</h4></td>
             <td align="center"><h4>竞赛审核状态</h4></td>
             <td align="center"><h4>查看详细</h4></td>
          </tr>
      </thead>
      <tbody>
      	<s:if test="#request.pageBean == null || #request.pagBean.recordList.size() == 0">
      		<tr>
      			<td colspan="8">当前没有竞赛信息！！！！！</td>
      		</tr>
      	</s:if>
      	<s:else>
      		<s:iterator value="#request.pageBean.recordList" var="competition">
      			<tr>
      				<td>${competition.compe_manager}</td>
      				<td><s:date name="#competition.compe_requestDate" format="yyyy-MM-dd"/></td>
      				<td><s:date name="#competition.compe_startTime" format="yyyy-MM-dd"/></td>
      				<td><s:date name="#competition.compe_endTime" format="yyyy-MM-dd"/></td>
      				<td>${competition.compe_money}</td>	
      				<td>${sessionScope.depManager.depM_department.de_name}</td>	
      				<td>${competition.compe_status==1?"已申请，正在审核":competition.compe_status==2?"审核通过":competition.compe_status==3?"竞赛正在进行中":competition.compe_status==4?"竞赛已经结束":"审核未通过"}</td>	
      				<td><a href="depManager_seeCompetitionDetail?compeId=${competition.compe_id }">查看详细</a></td>	
      			</tr>
      		</s:iterator>
      		<%-- <tr>
      			<td><a href="depManager_seeAllApplyCompetition?currentPage=0">首页</a></td>
      			<td><a href="depManager_seeAllApplyCompetition?currentPage=${currentPage-1<0?0:currentPage-1}">上一页</a></td>
      			<td><a href="depManager_seeAllApplyCompetition?currentPage=${currentPage+1>requestScope.pageBean.pageCount?requestScope.pageBean.pageCount:currentPage+1}">下一页</a></td>
      			<td><a href="depManager_seeAllApplyCompetition?currentPage=${requestScope.pageBean.pageCount }">尾页</a></td>
      		</tr> --%>
      	</s:else>
      </tbody>
</table>
<div class="container">
  <div class="row">
   <div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-4 col-xs-5 col-xs-offset-4">
           <p class="xixnxi">每页显示${requestScope.pageBean.pageSize }条，总记录数${requestScope.pageBean.recordCount }条</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
           <nav>
          <ul class="pagination">
            </li>
            <li><a href="javascript:gotoPage(1)">首页</a></li>
            <li><a href="javascript:gotoPage(${requestScope.pageBean.currentPage-1 })">上一页</a></li>
            <li><a href="#">${requestScope.pageBean.currentPage<1?1:requestScope.pageBean.currentPage }/${requestScope.pageBean.pageCount }</a></li>
            <li><a href="javascript:gotoPage(${requestScope.pageBean.currentPage+1 })">下一页</a></li>
            <li><a href="javascript:gotoPage(${requestScope.pageBean.pageCount })">尾页</a></li>
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
		if(pageNum > "${requestScope.pageBean.pageCount}"){
			pageNum = "${requestScope.pageBean.pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}	
		window.location.href="depManager_seeAllApplyCompetition?&currentPage=" + pageNum;
}					
</script>
<%-- <div class="footer" align="center">
	<nav>
      <ul class="pagination">
        <li><a href="depManager_seeAllApplyCompetition?currentPage=0">首页</a></li>
		<li><a href="depManager_seeAllApplyCompetition?currentPage=${currentPage-1<0?0:currentPage-1}">上一页</a></li>
		<li><a href="depManager_seeAllApplyCompetition?currentPage=${currentPage+1>requestScope.pageBean.pageCount?requestScope.pageBean.pageCount:currentPage+1}">下一页</a></li>
		<li><a href="depManager_seeAllApplyCompetition?currentPage=${requestScope.pageBean.pageCount }">尾页</a></li>
      </ul>
	</nav>
</div> --%>
</div>
</body>
</html>