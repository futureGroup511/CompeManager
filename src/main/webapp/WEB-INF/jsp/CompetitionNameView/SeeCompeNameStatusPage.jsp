<%@taglib prefix="s" uri="/struts-tags"%>
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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>css/xueyuan1-2.css" />
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<style type="text/css">
.table-bordered{
  width:60%;
  margin-left:20%;
  margin-top:4%;
}
</style>
</head>
<body>
		<div class="dangqian">
    		<div class="row">
		        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
		            <p>当前位置：学院负责人>>竞赛名称审核状态</p>
		        </div>
		        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
		            <p>欢迎 	${sessionScope.depManager.depM_name }  登录本系统</p>
		        </div>
    		</div>
		</div>
	<div class="container">
	<s:if test="#request.pageBean.recordList == null || #request.pageBean.recordList.size() == 0">
		当前没有已申请竞赛项目名称
	</s:if>
	<s:else>
	<table class="table table-striped table-bordered table-hover">
		<tr>
			<th style="text-align:center">竞赛项目名称</th>
			<th style="text-align:center">竞赛项目级别</th> 
			<th style="text-align:center">竞赛项目审核状态</th>
			<th style="text-align:center">未通过原因</th>
		</tr>
		<s:iterator value="#request.pageBean.recordList" var="compeName">
			<tr>
				<td>${compeName.compeName_name}</td>
				<td>${compeName.compeName_compeHierarchy.compeHie_name }</td>
				<s:if test="#compeName.compeName_status==0">
					<td style="background-color:red;">${compeName.compeName_status==1?"正在审核":compeName.compeName_status ==2?"审核成功":"审核失败"}</td>
				</s:if>
				<s:else>
					<td>${compeName.compeName_status==1?"正在审核":compeName.compeName_status ==2?"审核成功":"审核失败"}</td>
				</s:else>
					<td>${compeName.compeName_reason==null?"无":compeName.compeName_reason}</td>
			</tr>
		</s:iterator>
	</table>
	</s:else>
	</div>
	
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
		window.location.href="depManager_seeAllApplyCompNames?currentPage=" + pageNum;
}					
</script>
	
</body>
</html>