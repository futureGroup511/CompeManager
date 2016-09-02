<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index-content.css"/>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>

<body>
<div class="one">
	<div class="row">
    	<div class="col-sm-8  col-md-8 col-md-offset-1 col-lg-7 col-lg-offset-1">
        	<h3><p>竞赛通知系统</p></h3>
        </div>
        
    </div>
</div>
<div class="two">
	<div class="row">
    	<div class="col-sm-1  col-md-2 col-lg-2 col-lg-offset-1">
        		<p><img src="${pageContext.request.contextPath }/images/小人.png" /></p>
        </div>
        <div class="col-sm-5 col-md-4 col-lg-3 col-lg-offset-1 col-md-offset-1 col-xs-offset-1">
        	<ul class="xinxi">
            	<li><a href="#">蓝桥杯竞赛已拉开帷幕，敬请期待</a></li>
                <li><a href="#">蓝桥杯竞赛已拉开帷幕，敬请期待</a></li>
                <li><a href="#">蓝桥杯竞赛已拉开帷幕，敬请期待</a></li>
                <li><a href="#">蓝桥杯竞赛已拉开帷幕，敬请期待</a></li>
                <li><a href="#">蓝桥杯竞赛已拉开帷幕，敬请期待</a></li>
                <li><a href="#">蓝桥杯竞赛已拉开帷幕，敬请期待</a></li>
                <li><a href="#">蓝桥杯竞赛已拉开帷幕，敬请期待</a></li>
                <li><a href="#">蓝桥杯竞赛已拉开帷幕，敬请期待</a></li>
            </ul>
        </div>
        <div class="col-sm-2 col-md-2  col-lg-2">
        	<ul>
            	<li><a href="#">2016-2-4</a></li>
                <li><a href="#">2016-2-4</a></li>
                <li><a href="#">2016-2-4</a></li>
                <li><a href="#">2016-2-4</a></li>
                <li><a href="#">2016-2-4</a></li>
                <li><a href="#">2016-2-4</a></li>
                <li><a href="#">2016-2-4</a></li>
                <li><a href="#">2016-2-4</a></li>
            </ul>	
        </div>
        <form action="loginControll_login" id="form" method="post">
        
        </form>
        <div class="col-sm-3 col-md-3  col-lg-3 col-xs-pull-1">
         <div class="right">
        	<div class="input-one">
        		<div class="input-group">
            		<div class="input-group-addon"><p>身份</p></div>
    		        <select name="role" form="form" class="form-control input-lg">
                    	 <option value="学生">&ensp;&ensp;&ensp;学生</option>
                  		 <option value="学院负责人">&ensp;&ensp;&ensp;学院负责人</option>
                         <option value="教务处">&ensp;&ensp;&ensp;教务处负责人</option>
                    </select>
            	</div>
            </div>
            <div class="input-two">
        		<div class="input-group">
                    <div class="input-group-addon"><a><img src="${pageContext.request.contextPath }/images/用户头像.png"/></a></div>
                    <input form="from" type="text" class="form-control"  name="number" placeholder="请输入用户名">
                </div>
            </div>
            <div class="input-three">
            	<div class="input-group">
                    <div class="input-group-addon"><a><img src="${pageContext.request.contextPath }/images/密码图像.png"/></a></div>
                    <input form="frorm" type="text" class="form-control"  name="password" placeholder="请输入用户名">
                </div>
            </div>
            <div class="from group">
				<input  type="checkbox" name="useCookie" value="true" >自动登陆
			</div>
         	<p class="text-center text-danger" id="prompt">账号密码错误</p>
            <button onclick="login();" class="btn btn-large btn-block btn-primary" type="button">立即登陆</button>
         </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
	$(function(){
			
		$("#prompt").hide();
		
		
	});
	
	
	
	
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
