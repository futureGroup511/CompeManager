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
<title>导入学生信息</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/new.css" />
<script type="text/javascript" src="JQueryResources/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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

<div class="download">
	<div class="row">
    	<div class="col-lg-1 col-lg-offset-1 col-md-1 col-md-offset-1 col-xs-2 col-xs-offset-1">
        	<img src="images/xiazai.jpg" />
        </div>
        <div class="col-lg-2  col-md-2 col-xs-4 ">
        	<p>填写导入学生的信息</p><a href="<%=basePath %>ly/Students_model.xlsx">下载模板</a>
        </div>
    </div>
</div>
<div class="upload">
	<div class="row">
    	<div class="col-lg-1 col-lg-offset-1 col-md-1 col-md-offset-1 col-xs-2 col-xs-offset-1">
        	<img src="images/shangchuan.jpg" />
        </div>
        <div class="col-lg-4 col-md-4  col-xs-6 ">
        	<!-- <p>上传填好的员工信息表 ( 仅支持.xls/.xlsx格式,且文件大小不能超过2M )</p> --><!-- <a>上传文件</a> -->
        	<p>上传填好的学生信息表 ( 仅支持.xls/.xlsx格式,且文件大小不能超过2M )</p>
        	<s:form  action="admin_importStudent" method="post" enctype="multipart/form-data">
		    	<s:file id="file" style="border:1px;background-color:white;font-size:12px;text-decoration: none;" name="upload" label="" value="" ></s:file><br>
				<%-- <s:submit id="submit" style="border:1px;background-color:white;font-size:12px;text-decoration: none;" value="上传文件"> --%>
				<s:submit class="btn btn-info" id="submit"  value="导入学生">
				</s:submit>    
			</s:form>
        </div>
    </div>
</div>

<div class="next">
	<div class="row">
    	 <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-4 col-xs-offset-2">
        	 <!-- <button type="button" class="btn btn-info">下一步</button> -->
         </div>
    </div>
</div>
</body>
<script type="text/javascript">
	$("#submit").click(function(){
		var file = $("#file").val()
		var file1 =file.substr(file.length-3);
		if(file1 == ""){
			alert("请选择文件！");
			return false;
		} else {
			if(file1 == "lsx" | file1 == "xls"){
			}  else {
				alert("请选择正确的文件！");
				return false;
			}
		}
	})
</script>
</html>









<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>导入学生信息</title>
</head>
<body>

<a href="<%=basePath %>ly/Students_model.xlsx">下载模板</a>
<s:form  action="admin_importStudent" method="post" enctype="multipart/form-data">
    <label>竞赛方案&nbsp;:</label><s:file name="upload" label="" value="" ></s:file><br>
	<s:submit value="提交"></s:submit>    
</s:form>


</body>
</html> --%>