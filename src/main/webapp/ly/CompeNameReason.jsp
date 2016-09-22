<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
<title>请输入未通过原因</title>
<script type="text/javascript" src="../JQueryResources/jquery-2.1.4.js"></script>
<link rel="stylesheet" href="。。/css/bootstrap.css">
<link rel="stylesheet" href="../css/jiao4.css">
</head>
<body>
<%=basePath %>

<s:form onsubmit="alert('录入成功');window.close()" action="http://localhost:8080/CompetitionManager/competitionName_noPass.action" method="post">
	<s:hidden id="compeName_id"name="id"></s:hidden>
	<s:textarea id="compeName_reason" cssClass="form-control" name="reason" rows="3" ></s:textarea>
	<s:submit></s:submit>
</s:form>


</body>
<script type="text/javascript">
   $(function(){
	   var s = window.location.href.split('?')[1];
       var st = s.split('=');
       var id =st[1].split('&')[0]; 
   		$("#compeName_id").val(id);
   })
   
   function click(){
	   alert(123)
   }
   
   
</script>
</html>