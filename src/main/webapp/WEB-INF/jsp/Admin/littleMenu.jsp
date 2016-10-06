<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>小菜单</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jietu22.css">
</head>

<body>
<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
      <tbody>
      
<!--       <dl class="channel">
         <dt>信息管理<img src="images/select_xl01.png"></dt>
     	<dd><a href="" target="right">学院负责人</a> </dd>
    		<dd><a href="" target="right">学生</a></dd>
     	<dd><a href="" target="right">学院</a></dd>
     	<dd><a href="" target="right">竞赛等级</a></dd>
     	<dd><a href="" target="right">奖励标准</a></dd>
     	<dd><a href="" target="right">获奖等级</a></dd>
         <dd><a href="" target="right">导入学生数据</a> </dd>
     </dl> -->
	            
      <tr class="one">
         <td><a href="admin_findAll">学院负责人</a></td>
         <td><a href="awardstand_findAll">奖励标准</a></td>
       </tr>
        <tr>
          <td><a href="admin_findAllStudent">学生</a></td>
          <td><a href="comphier_findAllcomphier">竞赛等级</a></td>
        </tr>
         <tr>
          <td><a href="admin_finAllDepartment">学院</a></td>
          <td><a href="admin_importStudentUI">导入学生数据</a></td>
        </tr>
        <tr>
          <td><a href="awardhierar_findAll">获奖等级</a></td>
          <td></td>
        </tr>
      </tbody>
    </table>
 </div>
</body>
</html>
