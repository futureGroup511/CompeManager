<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询要审核得竞赛</title>
</head>
<body>
<form action="awardRecord_byCompeFindAward">
	<select name="id">
		<s:iterator value="awardRecords" var="compe">
			<option value="<s:property value="awardRecor_competition.compe_id" />"><s:date name="awardRecor_time" format="yyyy年"/>${awardRecor_competition.compe_compeName.compeName_name}</option>
		</s:iterator>
	</select> 
	<input type="submit" value="查询">
</form>
</body>
</html>