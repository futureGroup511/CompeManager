<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/tongzhi.css" />
<style>


* {
  box-sizing: border-box;
}

body {
  font-size: 62.5%;
}
.headingWrapper {
  text-align: center;
  background-color: #fff;
  
}

.header {
  display: inline-block;
  text-align: center;
  font-family: 'Francois One', Helvetica, Arial, sans-serif;
  font-size:55px;
  color: #e7e7e7;
  text-decoration: none;
  text-shadow: 1.5px 1.5px 0 #cac6c5, -1.5px -1.5px 0 #cac6c5, -1.5px -1.5px 0 #cac6c5, -1.5px 1.5px 0 #cac6c5, 1.5px -1.5px 0 #cac6c5;
  transition: all 400ms ease-in-out;
  margin-left:-45%;
  margin-top:20px;
}

.header--pushDown {
  text-shadow: 1.5px 1.5px 0 yellow, 0px 1.5px 0 yellow, -1.5px -1.5px 0 yellow, -1.5px -1.5px 0 yellow, -1.5px 1.5px 0 yellow, 1.5px -1.5px 0 yellow, 0.77782px 0.77782px 0 black, 1.55563px 1.55563px 0 black, 2.33345px 2.33345px 0 black, 3.11127px 3.11127px 0 black, 3.88909px 3.88909px 0 black, 4.6669px 4.6669px 0 black, 5.44472px 5.44472px 0 black, 6.22254px 6.22254px 0 black, 7.00036px 7.00036px 0 black, 7.77817px 7.77817px 0 black;
}


.color-bright .header {
  color:black;
  text-shadow: 1.5px 1.5px 0 green, -1.5px -1.5px 0 green, -1.5px -1.5px 0 green, -1.5px 1.5px 0 green, 1.5px -1.5px 0 green;
}
.color-bright .header--pushDown {
  text-shadow: 1.5px 1.5px 0 #fff, 0px 1.5px 0 #fff, -1.5px -1.5px 0 #fff, -1.5px -1.5px 0 #fff, -1.5px 1.5px 0 #fff, 1.5px -1.5px 0 #fff, 0.77782px 0.77782px 0 #ffffff, 1.55563px 1.55563px 0 #fff, 2.33345px 2.33345px 0 #fff;
}


</style>
</head>

<body>
	<div class="headingWrapper color-bright">
  		<p class="header header--pushDown header--shadow" title="HOVER ME">大学生竞赛管理系统</p>
	</div>
	<div class="container">
		<div class="head"></div>
		<div class="jumbotron">
		  <h1 class="text-center text-primary">${no.noti_title}</h1>
		  
		</div>
		<div class="jumbotron" >
			${no.noti_content}
		</div>
		<!-- <div class="head"></div> -->
	    <div class="last"></div>
	</div>
	<div class="footer">
	    	<p>版权所有&emsp;&emsp;河南科技学院&emsp;&emsp;河南省新乡市华兰大道东段&emsp;453003</p>
	</div>
</body>
</html>