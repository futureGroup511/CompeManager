<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改竞赛方案</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/xuanze.css">
</head>

<body>
<div class="container">
  <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处>>修改竞赛方案</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>
<div class="row">
     	
<s:form  action="competition_alterCompetitionProgram" method="post" enctype="multipart/form-data">
  	<s:hidden name="compe_id"></s:hidden><br>
  <div class="form-group">
     <div class="col-lg-2 col-lg-offset-4 col-md-2 scol-md-offset-4 col-xs-2  col-xs-offset-4">
       <!-- <button class="btn btn-primary" type="button">选择文件</button> -->
       <s:file name="compeProgramFile" label="上传123" value="" ></s:file><br>
     </div>
     <div class="col-lg-2 col-md-1 col-xs-1">
       <p class="seven"></p>
     </div>
      <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1">
       <s:submit cssClass="btn btn-primary" value="提交"></s:submit> 
       <!-- <button  type="button">上传</button> -->
     </div>
  </div>
</s:form>
</div>
</body>
</html>






<%-- 
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
</html> --%>