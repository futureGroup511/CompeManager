<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误信息提示页</title>
</head>
<body>
<%-- 错误信息提示也
<s:iterator value="errStuMap" id="entry">     
        <li>  
          <s:property value="#entry"/> 
         </li>  
</s:iterator>
==========================================<br> --%>


本次可导入人数：${num }
<br>
<br>
<br>
不可导入
<table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th>学号</th>
         <th>姓名</th>
         <th>身份证号</th>
         <th>年级</th>
         <th>错误提示</th>
       </tr>
<s:iterator value="errStuMap" id="column">  
	<tr>
		<th><s:property value="#column.key.stu_num" /></th>
		<th><s:property value="#column.key.stu_name" /></th>
		<th><s:property value="#column.key.stu_idCard" /></th>
		<th><s:property value="#column.key.stu_grade" /></th>
       
     	<th>
     
	     <s:iterator value="#column.value">  
	            <s:property value="value[0]" /><br>
	            <s:property value="value[1]" />
	            <s:property value="value[2]" />
	            <s:property value="value[3]" />
	            <s:property value="value[4]" />
	            <s:property value="value[5]" />
	            <s:property value="value[6]" />
	            <s:property value="value[7]" />
	            <s:property value="value[8]" />
	      </s:iterator>  
      	</th>
    <tr>
</s:iterator>  
</thead>
</table>

<a href="admin_importStudentUI">返回重新上传</a>
</body>
</html>