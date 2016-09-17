<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误信息提示页</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/new2.css" />
</head>

<body>
<div class="step">
	<div class="row">
        <div class="col-lg-2 col-lg-offset-1 col-md-3  col-xs-3  one">
        	<h1><i>01</i></h1><p>上传文件</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3 two">
        	<h1><i>02</i></h1><p>执行导入</p>
        </div>
        <div class="col-lg-2 col-md-3   col-xs-3  three">
        	<h1><i>03</i></h1><p>完成</p>
        </div>
      </div>  
</div>
<div class="zero">
	<div class="row">
    	<div class="col-lg-3 col-md-3  col-xs-6 ">
        	<img src="images/duihao.png" /><p>本次可导入人数：${num }人</p>
        </div> 
    </div>
</div>
<div class="single">
	<div class="row">
    	<div class="col-lg-3  col-md-3  col-xs-6 ">
        	<img src="images/tanghao.png"/><p>本次不可导入：${errorNum }人</p>
        </div> 
    </div>
</div>
<div class="next">
	<div class="row">
    	 <div class="col-lg-3 col-lg-offset-1 col-md-3 col-md-offset-1 col-xs-6 col-xs-offset-1">
        	 <!-- <button type="button" class="btn btn-info">下一步</button> --><a href="admin_importStudentUI">返回重新上传</a>
         </div>
    </div>
</div>
<div class="title">
	<div class="row">
    	<div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-4 col-xs-offset-1">
        	<p>不可导入的名单：</p>
        </div>
    </div>
</div>

 

<div class="table">
	<table class="table table-striped">
    	<tr class="first">
        	<td class="one"><P>学号</P></td>
            <td class="two"><p>姓名</p></td>
            <td class="three"><p>身份证号</p></td>
            <td class="four"><p>年级</p></td>
            <td class="five"><p>错误提示</p></td>
        </tr>
        
        
        <s:iterator value="errStuMap" id="column">  
			<tr>
        	<td class="six" align="center"><p><s:property value="#column.key.stu_num" /></p></td>
            <td class="seven" align="center"><p><s:property value="#column.key.stu_name" /></p></td>
            <td><s:property value="#column.key.stu_idCard" /></td>
            <td class="eight" align="center"><p><s:property value="#column.key.stu_grade" /></p></td>
            
            <s:iterator value="#column.value">
	            <td class="nine" align="left">
	            	<ul>
	                	<li><s:property value="value[0]" /></li>
	                    <li><s:property value="value[1]" /></li>
	                    <li><s:property value="value[2]" /></li>
	                    <li><s:property value="value[3]" /></li>
	                    <li><s:property value="value[4]" /></li>
	                    <li><s:property value="value[5]" /></li>
	                    <li><s:property value="value[6]" /></li>
	                    <li><s:property value="value[7]" /></li>
	                    <li><s:property value="value[8]" /></li>
	                </ul>
	            </td>
			</s:iterator>  
		    <tr>
		</s:iterator> 
    </table>
</div>
</body>
</html>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误信息提示页</title>
</head>
<body>

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
</html> --%>