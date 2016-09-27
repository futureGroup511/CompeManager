<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改奖励标准页面</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/jietu13.css" />
</head>

<body>
<div class="add">
	<div class="row">
         <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>修改奖励标准</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
    </div>
</div>


<form action="awardstand_modify" method="post">
<input type="hidden" name="award_id" value="${awardstand.award_id}">
 <input type="hidden" name="award_awardHierarchy.awardHie_id" value="${awardstand.award_awardHierarchy.awardHie_id}"> 
	<div class="container">
		<div class="one">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1">
	        		<p>竞赛类型：</p>
	        	</div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input name="award_type" class="form-control" value="${awardstand.award_type}"> 
	            </div>
	            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1">
	            	<p>学生获奖金额：</p>
	            </div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input name="award_stuMoney" class="form-control" value="${awardstand.award_stuMoney}">
	            </div>
	            
	        </div>
	    </div>
	    <div class="two">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1">
	        	<p>老师获奖金额：</p>
	        	</div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	<input class="form-control" name="award_teaMoney" value="${awardstand.award_teaMoney}">
	            </div>
	            
	        </div>
	    </div>
	
	</div>
	<div class="last">
	         <input type="submit" class="btn btn-default  active" value="提交">
	 </div>
</form>
</body>
</html>







<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改奖励标准页面</title>
</head>
<body>
	<form action="awardstand_modify" method="post">
		<input type="hidden" name="award_id" value="${awardstand.award_id}">		
	竞赛类型:<input name="award_type" value="${awardstand.award_type}">
	学生获奖金额：<input name="award_stuMoney" value="${awardstand.award_stuMoney}">
	老师获奖金额: <input name="award_teaMoney" value="${awardstand.award_teaMoney}">
	获奖奖励等级：<input  value="${awardstand.award_awardHierarchy.awardHie_name}" readonly="readonly">
			     <input type="hidden" name="award_awardHierarchy.awardHie_id" value="${awardstand.award_awardHierarchy.awardHie_id}"> 
				 <input type="submit">
	</form>
</body>
</html> --%>