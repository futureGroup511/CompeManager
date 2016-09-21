<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登陆大学生竞赛管理系统</title>
<script type="text/javascript">

//在被嵌套时就刷新上级窗口
if(window.parent != window){
	window.parent.location.reload(true);
}
</script>
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
.color-bright {
  background-image:url(images/beijing.jpg);
}
.color-bright .header--pushDown {
  text-shadow: 1.5px 1.5px 0 #fff, 0px 1.5px 0 #fff, -1.5px -1.5px 0 #fff, -1.5px -1.5px 0 #fff, -1.5px 1.5px 0 #fff, 1.5px -1.5px 0 #fff, 0.77782px 0.77782px 0 #ffffff, 1.55563px 1.55563px 0 #fff, 2.33345px 2.33345px 0 #fff;
}
</style>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/index222.css" />
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.js"></script>
</head>

<body onkeydown="keyLogin();">


<div class="headingWrapper color-bright">
  <p class="header header--pushDown header--shadow" title="HOVER ME">大学生竞赛管理系统</p>
</div>
<div class="one">
	<div class="row">
    	<div class="col-sm-8  col-md-8 col-md-offset-1 col-lg-7 col-lg-offset-1">
        	<h3><p>竞赛通知系统</p></h3>
        </div>
        
    </div>
</div>
<form action="loginControll_login" id="form" method="post"></form>
<div class="two">
	<div class="row">
    	<div class="col-sm-1  col-md-2 col-lg-2 col-lg-offset-1">
        		<p><img src="images/litleboy.png" /></p>
        </div>
        <div class="col-sm-5 col-md-4 col-lg-3 col-lg-offset-1 col-md-offset-1 col-xs-offset-1">
        	<ul class="xinxi">
        		<c:forEach items="${p.recordlist}" var="no">
				<%-- <tr>
					<td><a href="depManager_lookinfo?noti_id=${no.noti_id }">${no.noti_title}</a></td>
					
				</tr> --%>
				<li><a href="loginControll_lookinfo?noti_id=${no.noti_id }" target="bank">${no.noti_title}</a></li>
				</c:forEach>
            </ul>
           <!--  <div class="center-block" style="width:500px"> -->
			<ul class="pagination">
			<s:if test="#request.p.currentPage-1 <= 0">
				<li><a href="${pageContext.request.contextPath}/loginControll_loginView?currentPage=1"><span>&laquo;</span></a></li>
			</s:if>
			<s:elseif test="#request.p.currentPage-1 >= 1">
				<li><a href="${pageContext.request.contextPath}/loginControll_loginView?currentPage=${request.p.currentPage-1}"><span>&laquo;</span></a></li>				
			</s:elseif>
			<c:forEach begin="1" end="${request.p.pageCount}" varStatus="sta">
				<li><a href="${pageContext.request.contextPath}/loginControll_loginView?currentPage=${request.p.beginPageIndex+sta.index-1}">${request.p.beginPageIndex+sta.index-1}</a></li>	
			</c:forEach>
			
			<s:if test="#request.p.currentPage+1  > #request.p.pageCount">
				<li><a href="${pageContext.request.contextPath}/loginControll_loginView?currentPage=${request.p.pageCount}"><span>&raquo;</span></a></li>	
			</s:if>
			<s:elseif test="#request.p.currentPage+1 <= #request.p.pageCount">
				<li><a href="${pageContext.request.contextPath}/loginControll_loginView?currentPage=${request.p.currentPage+1}"><span>&raquo;</span></a></li>				
			</s:elseif>
			
			</ul>
		<!-- </div> -->
        </div>
        <div class="col-sm-2 col-md-2  col-lg-2">
        	<ul>
        		<c:forEach items="${p.recordlist}" var="no">
        		
        			<li><a href="#">${fn:substring(no.noti_time, 0,11)} </a></li>
        		</c:forEach>
            </ul>	
        </div> 
        <div class="col-sm-3 col-md-3  col-lg-3 col-xs-pull-1">
         <div class="right">
        	<div class="input-one">
        		<div class="input-group" form="form">
            		<div class="input-group-addon"><p>身份</p></div>
    		        <select class="form-control input-lg" name="role">
                    	 <option value="学生">&ensp;&ensp;&ensp;学生</option>
                  		 <option value="学院负责人">&ensp;&ensp;&ensp;学院负责人</option>
                         <option value="教务处">&ensp;&ensp;&ensp;教务处负责人</option>
                    </select>
            	</div>
            </div>
            <div class="input-two">
        		<div class="input-group">
                    <div class="input-group-addon"><a><img  src="images/user.png"/></a></div>
                    <input type="text" form="from" class="form-control"  name="number" placeholder="请输入用户名">
                </div>
            </div>
            <div class="input-three">
            	<div class="input-group">
                    <div class="input-group-addon"><a><img src="images/password.png"/></a></div>
                    <input form="form" type="password" class="form-control" name="password"  placeholder="密码">
                </div>
            </div>
            <!-- <div class="from group">
				<input  form="form" type="checkbox" name="useCookie" value="true" >自动登陆
			</div> -->
         	<p class="text-center text-danger" id="prompt">账号密码错误</p>
            <button class="btn btn-large btn-block btn-primary" type="submit" onclick="login();">登录</button>
         </div>
        </div>
    </div>
</div>
<div id="footer">
  <div class="row">
  	<div class="col-lg-6 col-lg-offset-3">
    	<p>版权所有&emsp;&emsp;河南科技学院&emsp;&emsp;河南省新乡市华兰大道东段&emsp;453003</p>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	
	$(function(){
		$("#prompt").hide();
		//监听键盘enter键的按下
		/*  $(document).keydown(function(e) {
			    if (e.keyCode == 13) {
			    	login();
			    }
			  }); */
		});
	function keyLogin(){
		 if (event.keyCode==13)  //回车键的键值为13
			 login(); //调用登录按钮的登录事件
		}
	
	function login(){
        var num=$("input[name='number']").val(); 
		var password=$("input[name='password']").val();
		var role=$("select").get(0).value;
		var datas={
				number:num,
				password:password,
				role:role,
		}
		$.ajax({
			url:"loginControll_juge",
			type:"post",
			data:datas,
			dataType:'json',
			async:false,
			success:function(msg){
				if(msg==="erro"){
					$("#prompt").show();
				}else if(msg==="correct"){
					$("#prompt").hide();
					$($("form").get(0)).submit();
				}
			}
		});
	}
</script>
</html>