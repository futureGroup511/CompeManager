<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加获奖单位以及修改时间</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/xueyuan3.css" />
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="JQueryResources/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/JQueryResources/laydate/laydate.js"></script>
<script type='text/javascript' src='ly/js/jquery.js'></script>
<script type='text/javascript' src='ly/js/jquery.scripts.js'></script>
<script type='text/javascript' src='ly/js/jquery.custom.js'></script>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 end -->
<link rel="stylesheet" type="text/css" media="all" href="ly/css/style.min.css" />
</head>

<body>
<div class="dangqian">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：学院负责人服务>>修改获奖信息</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.depManager.depM_name } 登陆本系统  </p>
        </div>
    </div>
</div>

<div class="container">
	<div class="one">
    	<div class="row">
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1">
        		<p>学号：</p>
        	</div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="awardRecor_student.stu_num" disabled="true" />
            </div>
            
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>姓名：</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="awardRecor_student.stu_name" disabled="true" />
            </div> 
        </div>
    </div>
    <div class="three">
    	<div class="row">
        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>性别：</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="awardRecor_student.stu_sex" disabled="true" />
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>班级：</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="awardRecor_student.stu_class" disabled="true" />
            </div>
        </div>
    </div>
    <div class="three">
    	<div class="row">
        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>院系：</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="awardRecor_student.stu_department.de_name" disabled="true" />
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛名称</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="awardRecor_competition.compe_compeName.compeName_name" disabled="true" />
            </div>
        </div>
    </div>
	
    <div class="three">
    	<div class="row">
        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>指导老师</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="awardRecor_coachTeacher" disabled="true" />
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>是否为团队负责人</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="awardRecor_manager" disabled="true" />
            </div>
        </div>
    </div>
    <div class="three">
    	<div class="row">
        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>团队名称</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="awardRecor_team" disabled="true"/>
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>获奖证书：</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	
            	<s:if test="awardRecor_picturePath == '' | awardRecor_picturePath == null">
					无
				</s:if>
				<s:else>
					<a class="image-icon" rel="gallery[modal]" href="${awardRecor_picturePath }">
					<img height="20" width="100" src="${awardRecor_picturePath }"></a>
				</s:else>
            </div>
        </div>
    </div>
      
    
    <form action="awardRecord_updateAwardRecord" method="post">
    	<s:hidden name="awardRecor_id"></s:hidden>
	    <div class="three">
	    	<div class="row">
	        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>获奖等级：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<s:select id="awardHieSelect" cssClass="form-control" label="按奖项查询" name="awardRecor_awadHie.awardHie_id" list="awardHieraychys" listKey="awardHie_id" listValue="'(' + awardHie_descr+ ')' + awardHie_name" headerKey="%{awardRecor_awadHie.awardHie_id }" headerValue="%{awardRecor_awadHie.awardHie_name }" />
	            </div>
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>学生奖金：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<s:textfield cssClass="form-control" id="awardRecor_stuMoney" name="awardRecor_stuMoney" disabled="true"/>
	            </div>
	        </div>
	    </div>
	    <div class="three">
	    	<div class="row">
	        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>老师奖金：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<s:textfield cssClass="form-control" id="awardRecor_teaMoney" name="awardRecor_teaMoney" disabled="true"/>
	            </div>
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>所加学分</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<s:textfield cssClass="form-control" name="awardRecor_score"/>
	            </div>
	        </div>
	    </div>
	    <div class="three">
	    	<div class="row">
	        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p style="color:red;">获奖日期</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input class="form-control" type="text" name=awardRecor_time onclick="laydate()" value="<s:date name='awardRecor_time' format='yyyy-MM-dd' />">
	            </div>
	            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p style="color:red;">发奖单位</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<s:textfield cssClass="form-control" name="awardRecor_unit" />
	            </div>
	        </div>
	    </div>
	    <div class="three">
	    	<div class="row">
	        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1">
	        		<s:submit cssClass="form-control" value="提交"></s:submit>
	        	</div>
	        </div>
	    </div>
	    
    </form>

</div>
<script type="text/javascript">

	$("#awardHieSelect").change(function(){
		
			var id = $("#awardHieSelect").val();
			var date = {
					"id" : id
			}
			
			$.ajax({
				//先走校验的action  
				url : 'awardstand_ajxa',
				type : 'post',
				data : date,
				dataType : 'text',
				success : function(data) {
					//alert(data);
					var json = eval('(' + data + ')');
					//alert(json.award_stuMoney);
					//alert(json.award_teaMoney);
					$("#awardRecor_stuMoney").val(json.award_stuMoney);
					$("#awardRecor_teaMoney").val(json.award_teaMoney);
				}

			});
			
			
		})
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
<title>添加获奖单位以及修改时间</title>
<script type="text/javascript" src="JQueryResources/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/JQueryResources/laydate/laydate.js"></script>
<script type='text/javascript' src='ly/js/jquery.js'></script>
<script type='text/javascript' src='ly/js/jquery.scripts.js'></script>
<script type='text/javascript' src='ly/js/jquery.custom.js'></script>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 end -->
<link rel="stylesheet" type="text/css" media="all" href="ly/css/style.min.css" />
</head>
<body>
学号：<s:textfield name="awardRecor_student.stu_num" disabled="true" /><br>
姓名：<s:textfield name="awardRecor_student.stu_name" disabled="true" /><br>
性别：<s:textfield name="awardRecor_student.stu_sex" disabled="true" /><br>
班级：<s:textfield name="awardRecor_student.stu_class" disabled="true" /><br>
院系：<s:textfield name="awardRecor_student.stu_department.de_name" disabled="true" /><br>

竞赛名称：<s:textfield name="awardRecor_competition.compe_compeName.compeName_name" disabled="true" /><br>

<br>
指导老师：<s:textfield name="awardRecor_coachTeacher" disabled="true" /><br>
是否为负责人：<s:textfield name="awardRecor_manager" disabled="true" /><br>
团队名称：<s:textfield name="awardRecor_team" disabled="true"/><br>
证书：<a class="image-icon" rel="gallery[modal]" href="${awardRecor_picturePath }">
	<img height="20" width="100" src="${awardRecor_picturePath }"></a>


<br>
<br>
<br>
<br>


<form action="awardRecord_updateAwardRecord" method="post">

<s:hidden name="awardRecor_id"></s:hidden>
获奖等级：
<s:select id="awardHieSelect" cssClass="form-control" label="按奖项查询" name="awardRecor_awadHie.awardHie_id" list="awardHieraychys" listKey="awardHie_id" listValue="'(' + awardHie_descr+ ')' + awardHie_name" headerKey="%{awardRecor_awadHie.awardHie_id }" headerValue="%{awardRecor_awadHie.awardHie_name }" /><br>
奖金：<s:textfield id="awardRecor_stuMoney" name="awardRecor_stuMoney" disabled="true"/><br>
老师奖金：<s:textfield id="awardRecor_teaMoney" name="awardRecor_teaMoney" disabled="true"/><br>
学分：<s:textfield name="awardRecor_score"/><br>
获奖日期：<s:textfield name="<s:date name='awardRecor_time' format='yyyy-MM-dd' />" />
<input class="form-control" type="text" name=awardRecor_time onclick="laydate()" value="<s:date name='awardRecor_time' format='yyyy-MM-dd' />">
<br>
发奖单位：<s:textfield name="awardRecor_unit" /><br>
<s:submit></s:submit>
</form>




</body>
<script type="text/javascript">

	$("#awardHieSelect").change(function(){
		
			var id = $("#awardHieSelect").val();
			var date = {
					"id" : id
			}
			
			$.ajax({
				//先走校验的action  
				url : 'awardstand_ajxa',
				type : 'post',
				data : date,
				dataType : 'text',
				success : function(data) {
					//alert(data);
					var json = eval('(' + data + ')');
					//alert(json.award_stuMoney);
					//alert(json.award_teaMoney);
					$("#awardRecor_stuMoney").val(json.award_stuMoney);
					$("#awardRecor_teaMoney").val(json.award_teaMoney);
				}

			});
			
			
		})
</script>
</html> --%>