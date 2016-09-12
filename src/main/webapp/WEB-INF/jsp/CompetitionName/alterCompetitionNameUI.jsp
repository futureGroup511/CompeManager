<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改竞赛名称</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/xinxitijiao.css">
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处>>修改竞赛名称</p>
        </div>
        <div class="col-lg-2 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>

<s:form action="competitionName_alter" method="post">
<s:hidden name="compeName_id"></s:hidden>
<div class="container">
	<div class="one">
    	<div class="row">
        	<div class="col-lg-1 col-md-1 col-xs-1"><p>竞赛名称：</p></div>
            <div class="col-lg-2 col-md-2 col-xs-2">
           		<s:textfield id="disabledTextInput" cssClass="form-control" name="compeName_name" /><br>	
            </div>
            <div class="col-lg-1 col-md-1 col-xs-1"><p>负责人:</p></div>
            <div class="col-lg-2 col-md-2 col-xs-2">
            	<s:textfield cssClass="form-control" name="compeName_descr"/><br>
            </div>
            <div class="col-lg-1 col-md-1 col-xs-1"><p>级别:</p></div>
            <div class="col-lg-2 col-md-2 col-xs-2">
				<s:textfield id="disabledTextInput" cssClass="form-control" name="compeName_compeHierarchy.compeHie_name" disabled="true"/><br>           
            </div> 
            <div class="col-lg-3  col-md-3 col-xs-3 ">
                 <s:submit cssClass="btn btn-primary" value="提交"></s:submit>
            </div>
        </div>
    </div>
</div>
</s:form>
</body>
</html>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改竞赛名称</title>
</head>
<body>
<s:form action="competitionName_alter" method="post">
     	<s:hidden name="compeName_id"></s:hidden><br>
        <label>竞赛名称&nbsp;:</label><s:textfield name="compeName_name" /><br>
        <label>负责人&nbsp;:</label><s:textfield name="compeName_descr"/><br>
        <label>级别&nbsp;:</label><s:textfield name="compeName_compeHierarchy.compeHie_name" disabled="true"/><br>
    	<s:submit value="提交"></s:submit>    
</s:form>
</body>
</html> --%>