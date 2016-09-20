<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改竞赛项目</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/xiugaijingsai.css" />
<script src="${pageContext.request.contextPath}/JQueryResources/laydate/laydate.js"></script>
<script type="text/javascript" src="jQuery-validator/jquery-1.11.1.js"></script>
</head>

<body>
<div class="dangqian">
   <div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>修改竞赛项目</p>
        </div>
        <div class="col-lg-2 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
    </div>
</div>

<s:form  action="competition_alterCompetition" method="post" enctype="multipart/form-data">
		<s:hidden name="compe_id"></s:hidden>
     	<s:hidden name="compe_status"></s:hidden>
     	
<div class="container">
	<div class="one">
    	<div class="row">
          <fieldset disabled>
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛名称：</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield id="disabledTextInput" cssClass="form-control" name="compe_compeName.compeName_name" disabled="true"/>
            </div>
            
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>院系:</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	
            	<s:textfield id="disabledTextInput" cssClass="form-control" name="compe_department.de_name" disabled="true"/>
            </div> 
            
          </fieldset>
        </div>
    </div>
    <div class="two">
    	<div class="row">
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>负责人:</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield  cssClass="form-control" name="compe_manager"/>
            </div>
            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>经费:</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="compe_money" />
            </div>
        </div>
    </div>
    
    <div class="four">
    	<div class="row">
        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>开始时间:</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<%-- <s:textfield cssClass="form-control" name="compe_startTime" /> --%>
            	<input class="form-control" type="text" name="compe_startTime" onclick="laydate()" value="<s:date name='compe_startTime' format='yyyy-MM-dd' />">
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>结束时间:</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<%-- <s:textfield cssClass="form-control" name="compe_endTime"/> --%>
            	<input class="form-control" type="text" name="compe_endTime" onclick="laydate()" value="<s:date name='compe_endTime' format='yyyy-MM-dd' />">
            </div>
        </div>
     </div>
     
     <div class="three">
    	<div class="row">
        	
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>申报时间:</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<%-- <s:textfield cssClass="form-control" name="compe_requestDate"/> --%>
            	<%-- <s:textfield name="compe_requestDate" placeholder="请输入日期" cssClass="form-control compe_requestDate" onclick="laydate()"></s:textfield> --%>
            	<%-- <s:textfield cssClass="form-control" name="compe_requestDate" onclick="laydate()"/> --%>
            	<input class="form-control" type="text" name="compe_requestDate" onclick="laydate()" value="<s:date name='compe_requestDate' format='yyyy-MM-dd' />">
            	<%-- <s:date name='compe_requestDate' format='yyyy-MM-dd' /> --%>
            </div>
            
            <%-- <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>描述:</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield cssClass="form-control" name="compe_digest" maxlength="200" width="300px"/>
            </div> --%>
        </div>
    </div>
    
    <div class="three">
    	<div class="row">
            
            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>描述:</p></div>
            <div class="col-lg-8 col-md-3 col-xs-3">
            	<%-- <s:textfield cssClass="form-control" name="compe_digest" maxlength="200" width="300px"/> --%>
            	<s:textarea cssClass="form-control" name="compe_digest" rows="5"></s:textarea>
            </div>
        </div>
    </div>
    
    
     <div class="last">
     	<s:submit cssClass="btn btn-default  active" value="提交"></s:submit>
     </div>
     </s:form>
     
     <div class="lastlast">
     	<p>
     		<a href="competition_alterCompetitionProgramUI?compe_id=${compe_id }">修改竞赛方案</a>
     	</p>
     </div>
</div>

<script type="text/javascript">
	$(function(){
		var a = $('.compe_requestDate').val();
		$(".compe_requestDate").css("display", 'none');
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
<title>修改竞赛项目</title>
</head>
<body>
	<s:form  action="competition_alterCompetition" method="post" enctype="multipart/form-data">
     	<s:hidden name="compe_id"></s:hidden><br>
     	<s:hidden name="compe_status"></s:hidden><br>
        <label>竞赛名称&nbsp;:</label><s:textfield name="compe_compeName.compeName_name" disabled="true"/><br>
        <label>负责人&nbsp;:</label><s:textfield name="compe_manager"/><br>
        <label>院系&nbsp;:</label><s:textfield name="compe_department.de_name" disabled="true"/><br>
        <label>经费&nbsp;:</label><s:textfield name="compe_money" /><br>
        <label>申报时间&nbsp;:</label><s:textfield name="compe_requestDate"/><br>
        <label>开始时间&nbsp;:</label><s:textfield name="compe_startTime" /><br>
        <label>结束时间&nbsp;:</label><s:textfield name="compe_endTime"/><br>
        <label>摘要&nbsp;:</label>
        <s:textfield name="compe_digest" maxlength="200" width="300px"/><br>
        <label>竞赛方案&nbsp;:</label><s:textfield name="compe_program" /><br>
    	<s:submit value="提交"></s:submit>    
     </s:form>
     <a href="competition_alterCompetitionProgramUI?compe_id=${compe_id }">修改竞赛方案</a>
</body>
</html> --%>