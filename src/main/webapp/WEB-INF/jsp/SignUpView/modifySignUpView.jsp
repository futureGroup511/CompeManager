<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<title>修改报名表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jietu20.css" />
</head>
<body>
	<div class="add">
		<div class="row">
	        <div class="col-lg-2 col-md-3  col-xs-4 col-xs-offset-1">
	           <p>修改信息</p>
	        </div>
	         <div class="col-lg-3 col-lg-offset-4 col-md-3 scol-md-offset-3 col-xs-5  col-xs-offset-1">
	            <p>当前位置：查看详细情况》修改报名表</p>
	        </div>
	        <div class="col-lg-2 col-md-3 col-xs-3">
	            <p>欢迎${depManager.depM_name}登录本系统</p>
	        </div>
	    </div>
	</div>
	
	
	<form action="depManager_modifySignUp">
		<input type="hidden" value="${signUp.signUp_id}" name="signup.signUp_id">
		<div class="container">
		<div class="one">
	    	<div class="row">
	        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>报名时间：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3"><input id="date" class="form-control" type="date" name="signup.signUP_time" value="${fn:substring(signUp.signUP_time,0,10)}"> </div>
	            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>指导老师：</p></div>
	            <div class="col-lg-3 col-md-3 col-xs-3"><input type="text" class="form-control" name="signup.signUp_teacher" value="${signUp.signUp_teacher}"></div>
	            
	        </div>
	    </div>
    
	    <div class="three">
	    	<div class="row">
	        	
	            <div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><span>竞赛类型：</span></div>
	            <div class="col-lg-3 col-md-3 col-xs-3">
	            	
	            	<s:if test="#request.signUp.singnup_type==1">
	            		<label class="redio-inline redio-one">
	            		<input type="radio" name="signup.singnup_type" value="1" checked="checked"  onclick="return false" id="inlineRadiol" >团队
					 	 </label>
					 	<label class="redio-inline redio-two">
	                    <input type="radio" name="signup.singnup_type" onclick="return false" id="inlineRadio2" value="2" >个人
	                    </label>
		 			</s:if> 
	                <s:if test="#request.signUp.singnup_type==2">
					 	<label class="redio-inline redio-one">
	            		<input type="radio" name="signup.singnup_type" value="1"   onclick="return false" id="inlineRadiol" >团队
					 	 </label>
					 	<label class="redio-inline redio-two">
	                    <input type="radio" name="signup.singnup_type" onclick="return false" id="inlineRadio2" value="2" checked="checked">个人
	                    </label>
				 	</s:if>
	                    
	                 
	                  
	            </div>
	            <s:if test="#request.signUp.singnup_type==1">
		 			<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>团队名称：</p></div>
		            <div class="col-lg-3 col-md-3 col-xs-3">
		               <input type="text" name="signup.signUp_team"  class="form-control"  value="${signUp.signUp_team}">
				     </div>
		 		</s:if> 
	            
			 </div>
		</div>
	</div>
	
		<div class="last">
        	<button class="btn btn-default  active">提交</button>
 		</div>
	</form>
</body>
 
</html>