<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>进入下一阶段</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xue2.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
		<jsp:include page="operation.jsp"></jsp:include>
		<div class="dangqian">
		  <div class="row">
		        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
		            <p>当前位置：学生服务>>进入下一阶段</p>
		        </div>
		        <div class="col-lg-2 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
		            <p>欢迎${stu.stu_name}登录本系统</p>
		        </div>
		  </div>
		</div>
		
		<div class="table-responsive">
			<p class="text text-danger"><strong>如找不到理想结果请先上传附件</strong></p>
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="two">
						<th>#</th>
						<th>竞赛名称</th>
						<th>竞赛类型(个人/团队(队名))</th>
						<th>报名时间</th>
						<th>进入下一阶段</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${signUps}" varStatus="status" var="signUp">
						<tr>
							<td>${statu.index+1}</td>
							<td>${signUp.signUp_competition.compe_compeName.compeName_name}</td>
							
							<c:if test="${ signUp.signUp_team eq null}">
									<td>个人</td>
							</c:if>
							<c:if test="${signUp.signUp_team ne null}">
									<td>团队(${signUp.signUp_team })</td>
							</c:if>
							<td>${fn:substring(signUp.signUP_time,0,11)}</td>
							
							<c:if test="${signUp.nextClass eq 1}">
								<c:if test="${signUp.singUp_manager eq 1}">
									<td><a href="${pageContext.request.contextPath}/student_nextStage?sup.signUp_team=${signUp.signUp_team}" class="btn btn-primary" onclick="return jugeNextTeam(this);">进入下一阶段</a></td>
								</c:if>
								<c:if test="${signUp.singUp_manager eq 0}">
									<td><p class="text text-danger">请联系团队负责人</p></td>	
								</c:if>
								<c:if test="${signUp.singUp_manager ne 1 and signUp.singUp_manager ne 0}">
										<td><a href="${pageContext.request.contextPath}/student_promotion?sup.signUp_id=${signUp.signUp_id}" class="btn btn-primary" onclick="return jugeNext();">进入下一阶段</a></td>
								</c:if>
								
							</c:if>
							<td>
								
							</td>
						
						</tr>
					
					</c:forEach>
				
				</tbody>
		</table>
		</div>
</body>
<script type="text/javascript">
 function jugeNext(){
	var juge=confirm("是否进入下一阶段");
	if(juge===false){
		return false;
	}
 }
 
 function jugeNextTeam(arr){
	 var juge=confirm("是否进入下一阶段");
		if(juge===false){
			return false;
		}else{
			var value=$(arr).attr("href");
			var datas=value.split('=');
			var data={"sup.signUp_team":datas[1]};
			$.ajax({
				url:"student_jugeTeamPcturePath",
				type:'post',
				data:data,
				dataType:'json',
				async:false,
				success:function(data){
					if(data==="true"){
						return true;
					}else{
						alert("团队成员上传附件不完整！");
						return false;
					}
					
				}
			});
		}
 }
</script>
</html>