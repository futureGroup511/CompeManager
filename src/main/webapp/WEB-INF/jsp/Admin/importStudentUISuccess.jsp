<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导入成功</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/new3.css" />
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
        	<img src="images/duihao.png"/><p>成功导入人数：${num }人</p>
        </div> 
    </div>
</div>
<div class="next">
	<div class="row">
    	 <div class="col-lg-3 col-lg-offset-1 col-md-3 col-md-offset-1 col-xs-6 col-xs-offset-1">
        	<!--  <button type="button" class="btn btn-info">完成</button> -->
         </div>
    </div>
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
<title>导入成功</title>
</head>
<body>
导入成功人数：${num }
</body>
</html> --%>
