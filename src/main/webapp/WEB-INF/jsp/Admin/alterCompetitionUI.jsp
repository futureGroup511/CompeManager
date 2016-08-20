<%@ page language="java" contentType="text/html; charset=UTF-8"
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
        <%-- <label>竞赛方案&nbsp;:</label><s:textfield name="compe_program" /><br> --%>
        
        
        <label>竞赛方案&nbsp;:</label><s:file name="upload" label="上传"></s:file><br>
    	<s:submit value="提交"></s:submit>    
     </s:form>
</body>
</html>