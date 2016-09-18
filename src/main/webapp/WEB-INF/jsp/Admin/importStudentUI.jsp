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
<title>Insert title here</title>
</head>
<body>

<a href="<%=basePath %>ly/Students_model.xlsx">下载模板</a>
<s:form  action="admin_importStudent" method="post" enctype="multipart/form-data">
    <label>竞赛方案&nbsp;:</label><s:file name="upload" label="" value="" ></s:file><br>
	<s:submit value="提交"></s:submit>    
</s:form>


</body>
</html>