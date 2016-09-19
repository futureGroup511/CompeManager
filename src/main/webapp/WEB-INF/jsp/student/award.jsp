<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>获奖名单</title>
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
		            <p>当前位置：学生服务>>获奖记录</p>
		        </div>
		        <div class="col-lg-2 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
		            <p>欢迎${stu.stu_name}登录本系统</p>
		        </div>
		  </div>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr class="two">
						<th>#</th>
						<th>竞赛名称</th>
						<th>竞赛类型(个人/团队(队名))</th>
						<th>获奖时间</th>
						<th>获奖等级</th>
						<th>获得奖金</th>
						<th>上传附件</th>
					    <th>是否进入下一阶段</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.recordlist}" varStatus="status" var="award">
						<tr>
							<td>${statu.index+1}</td>
							<td>${award.awardRecor_competition.compe_compeName.compeName_name}</td>
							
							<c:if test="${ award.awardRecor_team eq null}">
									<td>个人</td>
							</c:if>
							<c:if test="${award.awardRecor_team ne null}">
									<td>团队(${award.awardRecor_team })</td>
							</c:if>
							<td>${fn:substring(award.awardRecor_time,0,11)}</td>
							<td>${award.awardRecor_awadHie.awardHie_name}</td>
							<td>${award.awardRecor_stuMoney}</td>
							
							<td>
								<a href="student_uploadView?award_id=${award.awardRecor_id }" class="btn btn-primary">上传附件</a>
								
								<c:if test="${!empty award.awardRecor_picturePath }">
										(<span class="text-danger">已上传过</span>)
								</c:if>
							</td>
							<td>
								<c:if test="${jugePromotion ge award.awardRecor_competition.compe_endTime and  award.awardRecor_competition.compe_status eq 2  }">.
										<c:if test="${!empty award.awardRecor_picturePath}">
											<a href="${pageContext.request.contextPath}/student_promotion?award_id=${award.awardRecor_id }" class="btn btn-primary" onclick="return jugeNext();">进入下一阶段</a>
										</c:if>
										<c:if test="${empty award.awardRecor_picturePath}">
											(<span class="text-danger">请先上传附件</span>)
										</c:if>
								</c:if>
							
							</td>
						</tr>
					
					</c:forEach>
				
				</tbody>
		</table>
		
		</div>
		
		<div class="center-block" style="width:500px">
			<ul class="pagination">
			<s:if test="#request.page.currentPage-1 <= 0">
				<li><a href="${pageContext.request.contextPath}/student_lookAward?currentPage=1"><span>&laquo;</span></a></li>
			</s:if>
			<s:elseif test="#request.page.currentPage-1 >= 1">
				<li><a href="${pageContext.request.contextPath}/student_lookAward?currentPage=${request.page.currentPage-1}"><span>&laquo;</span></a></li>				
			</s:elseif>
			<c:forEach begin="1" end="${request.page.pageCount}" varStatus="sta">
				<li><a href="${pageContext.request.contextPath}/student_lookAward?currentPage=${request.page.beginPageIndex+sta.index-1}">${request.page.beginPageIndex+sta.index-1}</a></li>	
			</c:forEach>
			
			<s:if test="#request.page.currentPage+1 > #request.page.pageCount">
				<li><a href="${pageContext.request.contextPath}/student_lookAward?currentPage=${request.page.pageCount}"><span>&raquo;</span></a></li>	
			</s:if>
			<s:elseif test="#request.page.currentPage+1 <= #request.page.pageCount">
				<li><a href="${pageContext.request.contextPath}/student_lookAward?currentPage=${request.page.currentPage+1}"><span>&raquo;</span></a></li>				
			</s:elseif>
			
			</ul>
		</div>
		
</body>
<script type="text/javascript">
 function jugeNext(){
	var juge=confirm("是否进入下一阶段");
	if(juge===false){
		return false;
	}
 }
 

</script>
</html>