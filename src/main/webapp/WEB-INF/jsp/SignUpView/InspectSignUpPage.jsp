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
<title>审核报名</title>
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<link rel="stylesheet" href="<%=basePath %>css/xueyuan9.css"/>
<style type="text/css">

.table-bordered{
  width:110%;
}

</style>
</head>
<body>
<div class="dangqian">
    		<div class="row">
		        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
		            <p>当前位置：学院负责人>>审核报名</p>
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
          	  <th style="text-align:center">竞赛</th>
              <th style="text-align:center">指导教师</th>
              <th style="text-align:center">类型</th>
              <th style="text-align:center">团队名称</th>
              <th style="text-align:center">负责人</th>
              <th style="text-align:center">状态</th>
              <th style="text-align:center">时间</th>
              <th style="text-align:center">院系</th>
              <th style="text-align:center">班级</th>
              <th style="text-align:center">姓名</th>
              <th style="text-align:center">学号</th>
              <th style="text-align:center">通过</th>
              <th style="text-align:center">不通过</th>
              <th style="text-align:center">指定为负责人</th>
          </tr>
      </thead>
      <tbody>
      	<s:if test="#request.pageBean == null || #request.pageBean.recordList.size() == 0">
      		<tr>
      			<td colspan="8">当前没有竞赛信息！！！！！</td>
      		</tr>
      	</s:if>
      	<s:else>
      		<s:iterator value="#request.pageBean.recordList" var="signUp">
      			<tr>
      				<td>${signUp.signUp_competition.compe_compeName.compeName_name}</td>
      				<td>${signUp.signUp_teacher}</td>
      				<td>${signUp.singnup_type==1?"团体":"个人" }</td>
      				<td>${signUp.singnup_type==1?signUp.signUp_team:"----------" }</td>
      				<td>${signUp.singnup_type==2?"----------":signUp.singUp_manager==1?"是":"否"}</td>
      				<td>${signUp.signUp_status==1?"已报名":signUp.signUp_status==2?"审核通过":"审核未通过"}</td>	
      				<td><s:date name="#signUp.signUP_time" format="yyyy-MM-dd"/></td>
      				<td>${signUp.signUp_student.stu_department.de_name}</td>	
      				<td>${signUp.signUp_student.stu_class}</td>
      				<td>${signUp.signUp_student.stu_name}</td>	
      				<td>${signUp.signUp_student.stu_num}</td>
      				
      				<td>
      					<s:if test="#signUp.signUp_status==1">
	      					<a href="depManager_inspectSuccess?signId=${signUp.signUp_id }&currentPage=${requestScope.pageBean.currentPage}">我要审核</a>
      					</s:if>
      					<s:else>
      						${signUp.signUp_status==2?"通过":"未通过"}
      					</s:else>
      				</td>
      				<td>
      					<s:if test="#signUp.signUp_status==2">
	      					<a href="depManager_inspectFailure?signId=${signUp.signUp_id }&currentPage=${requestScope.pageBean.currentPage}">禁止通过</a>
      					</s:if>
      					<s:elseif test="#signUp.signUp_status==1">
	      					待审核状态
      					</s:elseif>
      					<s:else>
      						已禁止
      					</s:else>
      				</td>
      				<td>
      					<s:if test="#signUp.singUp_manager==1">
							已是负责人
      					</s:if>
      					<s:elseif test="#signUp.signUp_status==3">
      						审核未通过
      					</s:elseif>
      					<s:elseif test="#signUp.singnup_type==2">
      						-------
      					</s:elseif>
      					<s:elseif test="#signUp.singUp_manager==0">
      						<a href="depManager_inspectToTeamLeader?signId=${signUp.signUp_id }&teamName=${signUp.signUp_team }&currentPage=${requestScope.pageBean.currentPage}">指定为负责人</a>
      					</s:elseif>
      				</td>	
      			</tr>
      		</s:iterator>
      		<%-- <tr>
      			<td><a href="depManager_inspectStudentApplyPage?currentPage=0">首页</a></td>
      			<td><a href="depManager_inspectStudentApplyPage?currentPage=${currentPage-1<0?0:currentPage-1}">上一页</a></td>
      			<td><a href="depManager_inspectStudentApplyPage?currentPage=${currentPage+1>requestScope.pb.pageCount?requestScope.pb.pageCount:currentPage+1}">下一页</a></td>
      			<td><a href="depManager_inspectStudentApplyPage?currentPage=${requestScope.pb.pageCount }">尾页</a></td>
      		</tr> --%>
      	</s:else>
      </tbody>
</table>
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
		window.location.href="depManager_inspectStudentApplyPage?currentPage=" +pageNum;
}					
</script>
<%-- <div class="footer">
	<nav>
      <ul class="pagination">
        </li>
       <li><a href="depManager_inspectStudentApplyPage?currentPage=0">首页</a></li>
		<li><a href="depManager_inspectStudentApplyPage?currentPage=${currentPage-1<0?0:currentPage-1}">上一页</a></li>
		<li><a href="depManager_inspectStudentApplyPage?currentPage=${currentPage+1>requestScope.pb.pageCount?requestScope.pb.pageCount:currentPage+1}">下一页</a></li>
		<li><a href="depManager_inspectStudentApplyPage?currentPage=${requestScope.pb.pageCount }">尾页</a></li>
        </li>
      </ul>
	</nav>
</div> --%>
</body>
</html>