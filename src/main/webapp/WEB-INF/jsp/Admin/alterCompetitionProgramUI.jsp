<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改竞赛方案</title>
</head>
<body>
     <s:form  action="competition_alterCompetitionProgram" method="post" enctype="multipart/form-data">
     	<s:hidden name="compe_id"></s:hidden><br>
        <label>竞赛方案&nbsp;:</label><s:file name="compeProgramFile" label="上传123" value="" ></s:file><br>
    	<s:submit value="提交"></s:submit>    
     </s:form>
</body>
</html>