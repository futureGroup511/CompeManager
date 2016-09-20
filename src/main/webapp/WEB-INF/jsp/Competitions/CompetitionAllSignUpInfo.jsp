<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>竞赛报名所有学生信息</title>
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>css/xueyuan4.css"/>
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<%-- <script type="text/javascript" src="<%=basePath %>JQueryResources/fixError.js"></script> --%>
</head>
<body>
<div class="dangqian">
    <div class="row">
       <!--  <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
            <a><p></p></a>
        </div> -->
        <div class="col-lg-4 col-lg-offset-6 col-md-4 col-md-offset-3 col-xs-5  col-xs-offset-1">
            <p>当前位置：学院负责人>>报名信息</p>
        </div>
        <div class="col-lg-3 col-md-3 col-xs-3">
            <p>欢迎  ${sessionScope.depManager.depM_name } 登录本系统</p>
        </div>
    </div>
</div>
<div class="container"> 
     <table class=" table table-striped table-bordered table-hover">
		<thead>
			<tr>
			  <th>学生所在院系</th>
			  <th>学生所在班级</th>
              <th>学生学号</th>
              <th>学生姓名</th>
              <th>指导老师</th>
              <th>竞赛名称</th>
              <th>修改</th>
          </tr>
		</thead>
		<s:if test="#request.pageBean.recordList != null && #request.pageBean.recordList.size() >0">
			<s:iterator value="#request.pageBean.recordList" var="signUp">
				<tr>
					<td><s:property value="#signUp.signUp_student.stu_department.de_name"/></td>
					<td><s:property value="#signUp.signUp_student.stu_class"/></td>
					<td><s:property value="#signUp.signUp_student.stu_num"/></td>
					<td><s:property value="#signUp.signUp_student.stu_name"/></td>
					<td><s:property value="#signUp.signUp_teacher"/></td>
					<td><s:property value="#signUp.signUp_competition.compe_compeName.compeName_name"/></td>
					<td><a href="depManager_modifySignUpView?signup.signUp_id=${signUp.signUp_id}" class="btn btn-primary">修改报名表</a></td>
				</tr>
			</s:iterator>
			
		</s:if>
		<s:else>
			<tr>
				<td colspan="6">
					没有需要录入成绩的信息
				</td>
			</tr>
		</s:else>
	</table>
</div>
<div class="footer">
	<nav>
      <ul class="pagination">
		 </li>
		<li><a href="depManager_seeSignUpsDetails?currentPage=0&compeId=${compeId }">首页</a></li>
		<li><a href="depManager_seeSignUpsDetails?currentPage=${currentPage-1<0?0:currentPage-1}&compeId=${compeId }">上一页</a></li>
		<li><a href="depManager_seeSignUpsDetails?currentPage=${currentPage+1>requestScope.pb.pageCount?requestScope.pb.pageCount:currentPage+1}&compeId=${compeId }">下一页</a></li>
		<li><a href="depManager_seeSignUpsDetails?currentPage=${requestScope.pb.pageCount }&compeId=${compeId }">尾页</a></li>
        </li>
      </ul>
	</nav>
</div>
</body>
</html>