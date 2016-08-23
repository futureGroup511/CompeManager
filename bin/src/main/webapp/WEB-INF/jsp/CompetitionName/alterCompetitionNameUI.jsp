<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</html>