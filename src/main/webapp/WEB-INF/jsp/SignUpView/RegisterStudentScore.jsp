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
<title>登记获奖学生学分</title>
<script type="text/javascript" src="JQueryResources/jquery-2.1.4.js"></script>
<script type="text/javascript">
	$(function(){
		var oldValue = null;
		$("#awardHieSelect").change(function(){
			if(oldValue != null){
				$("."+oldValue)[0].style.display="none";
				$("."+oldValue)[1].style.display="none";
			}
			var value = $(this).children('option:selected').val();
			$("."+value)[0].style.display="table-cell";
			$("."+value)[1].style.display="table-cell";
			oldValue = value;
		})
		$(".btn").click(function(){
			$(".scoreAddedSpan").css("display", 'none');
			$(".zsCompeHieClass").css("display", 'none');
			var ScoreAdded = $(".ScoreAdded").val();
			if(ScoreAdded == null || ScoreAdded.trim()=="" || !/^\+?[0-9][0-9]*$/.test(ScoreAdded)){
				$(".scoreAddedSpan").css("display", 'inline');
				return false;
			}
			var compeHieClassVal = $(".compeHieClass option:selected").val();
			
			if(compeHieClassVal ==null || compeHieClassVal ==0){
				$(".zsCompeHieClass").css("display", 'inline');
				return false;
			}
			
			var mes=confirm("请确定录入成绩无误！确定好录入");
			if(mes==true){
				return true; 
			}
			else{
				return false; 
			}
			
			return true;
		});
		
	});
</script>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/xueyuan 7css.css" />
<script src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<%-- <script type="text/javascript" src="<%=basePath %>JQueryResources/fixError.js"></script> --%>
<script src="js/bootstrap.js"></script>
</head>
<body>
<div class="dangqian">
    		<div class="row">
		        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
		            <p>当前位置：学院负责人>>录入成绩</p>
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
			  <th>学生所在院系</th>
			  <th>学生所在班级</th>
              <th>学生学号</th>
              <th>学生姓名</th>
              <th>指导老师</th>
              <th>竞赛名称</th>
              <th>所加学分</th>
              <th>获奖等级</th>
              <th>提交</th>
              <th>老师奖金</th>
              <th>学生奖金</th>
          </tr>
		</thead>
		<s:if test="#request.signUp != null">
				<tr>
					<td><s:property value="#request.signUp.signUp_student.stu_department.de_name"/></td>
					<td><s:property value="#request.signUp.signUp_student.stu_class"/></td>
					<td><s:property value="#request.signUp.signUp_student.stu_num"/></td>
					<td><s:property value="#request.signUp.signUp_student.stu_name"/></td>
					<td><s:property value="#request.signUp.signUp_teacher"/></td>
					<td><s:property value="#request.signUp.signUp_competition.compe_compeName.compeName_name"/></td>
					<s:form action="depManager_registerScoreToRecord" method="post">
						<td>
						<s:textfield  class="ScoreAdded form-control" name="ScoreAdded"></s:textfield>
						<span class="scoreAddedSpan" style="display:none;color:red;font-size:20px;">请填写正整数，符合规范</span>
						</td>
						
						<td>
						<s:select  class="compeHieClass form-control" id="awardHieSelect" name="awardHieId" list="#request.hieList" listKey="awardHie_id" listValue="awardHie_name" headerKey="0" headerValue="==请选择=="></s:select>
						<span class="zsCompeHieClass" style="display:none;color:red;font-size:20px;">请选择此项内容</span>
						</td>
						<td><s:submit value="提交" class="btn btn-default active"></s:submit></td>
						<s:iterator value="#request.hieList" var="hie">
						<td class="${hie.awardHie_id }" style="display: none">${hie.awardHie_standard.award_stuMoney }</td>
						<td class="${hie.awardHie_id }" style="display: none">${hie.awardHie_standard.award_teaMoney }</td>
						</s:iterator>
						<s:hidden name="registerSignUpId" value="%{#request.signUp.signUp_id }"></s:hidden>
						<s:hidden name="groupIsOrNot" value="%{#request.groupIsOrNot }"></s:hidden>
						<s:hidden name="currentPage" value="%{#request.currentPage }"></s:hidden>
					</s:form>
				</tr>
		</s:if>
		<s:else>
			<tr>
				<td colspan="11">
					没有需要录入成绩的信息
				</td>
			</tr>
		</s:else>
	</table>
</div>
</body>
</html>