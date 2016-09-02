 <%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	//得到url的根路径
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学院负责人</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/biaodan.css" />
<style>
	.container{
		margin-top:200px;
	}
	.dangqian{
	margin-top:50px;
	}
</style>
</head>

<body>
<div class="dangqian">
   <div class="row">
       <!--  <div class="col-lg-1 col-lg-offset-1 col-md-2  col-xs-2 col-xs-offset-1">
            <a><p>  </p></a>
        </div> -->
        <div class="col-lg-3 col-lg-offset-5 col-md-4 col-md-offset-2 col-xs-6">
            <p>当前位置：学院负责人>>录入成绩</p>
        </div>
        <div class="col-lg-2 col-md-3 col-xs-3">
            <p>欢迎 	${sessionScope.depManager.depM_name }  登录本系统</p>
        </div>
    </div>
</div>
<div class="container">
 <div class="row">
 <s:if test="#request.compeList != null && #request.compeList.size() > 0">
 	<s:form action="depManager_registerScore">
         <div class="col-lg-4 col-lg-offset-1  col-md-4  col-md-offset-1 col-xs-4 col-lg-offset-1">                          
           <%--  <select class="form-control">                         
                <option>2016-8-12 申请的 最新8.23</option>                      
                <option>2</option>                      
                <option>3</option>                     
             </select>  --%>
             <select name="compeId" class="form-control">
				<s:iterator value="#request.compeList" var="compe">
					<option value="<s:property value="#compe.compe_id" />"><s:date name="#compe.compe_requestDate" format="yyyy-MM-dd"/> 申请的 ${compe.compe_compeName.compeName_name}</option>
				</s:iterator>
			</select>                       
         </div> 
         <div class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-xs-6 col-xs-offset-1">                                    
             <div class="radio">                          
                <label class="radio-inline">                       
                    <input type="radio" name="signType" id="inlineRadio1" value="1" checked>团体                  
                </label>                      
                <label class="radio-inline">                        
                    <input type="radio" name="signType" id="inlineRadio2" value="2"> 个人                   
                </label> 
                
                
              <%--   <s:radio list="#{'1':'团体', '2':'个人' }" name="signType" value="1"></s:radio>   --%>
                <s:submit value="录入此竞赛成绩" class="btn btn-default  active"></s:submit>                   
                <!-- <button type="button" class="btn btn-default  active">提交</button>  -->                   
              </div> 
          </div>
      </s:form>
    </s:if>
    <s:else>
		暂无竞赛结果需要填写
	</s:else>
	</div>
</div>                         
</body>
</html>
