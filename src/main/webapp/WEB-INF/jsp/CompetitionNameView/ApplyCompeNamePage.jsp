<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>css/xueyuan8.css" />
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<%-- <script type="text/javascript" src="<%=basePath %>JQueryResources/fixError.js"></script> --%>
<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery.validate.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".btn").click(function(){
		$(".compeNameError").css("display", "none");
		$(".compeHieError").css("display", "none");
		$(".compeDescError").css("display", "none");
		var compeName = $(".compName").val();
		var compeHie = $(".compHie").val();
		var compeDesc = $(".compDesc").val();
		if(compeName == null || compeName.trim() == ""){
			$(".compeNameError").css("display", "inline");
			return false;
		}
		if(compeHie==0 || compeHie ==null){
			$(".compeHieError").css("display", "inline");
			return false;
		}
		if(compeDesc == null || compeDesc.trim() == ""){
			$(".compeDescError").css("display", "inline");
			return false;
		}
		return true;
	});
});
</script>
</head>
<body>
	<div class="dangqian">
	  <div class="row">   
	        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
	            <p>当前位置：学院负责人>>申请名称</p>
	        </div>
	        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
	            <p>欢迎 	${sessionScope.depManager.depM_name }  登录本系统</p>
	        </div>
	  </div>
	</div>


	<div class="container" >
	<s:form method="post" action="depManager_saveCompeName" id="compeNameRegister">
	<div class="row">
        	<div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛名称</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            <s:textfield class="form-control compName" name="competitionName.compeName_name"></s:textfield>
            <span class="compeNameError" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛等级</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
                <s:select  class="form-control compHie" name="competitionName.compeName_compeHierarchy.compeHie_id" list="competitionHierarchies" listKey="compeHie_id" listValue="compeHie_name" headerKey="0" headerValue="==请选择竞赛级别=="></s:select>
                <span class="compeHieError" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
    </div>
    <div class="part-two">
        <div class="row">
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-3 col-xs-offset-1"><p>竞赛相关描述</p></div>
            <div class="col-lg-9 col-md-9 col-xs-7">
             	 <s:textarea  class="compDesc form-control" rows="5" name="competitionName.compeName_descr">
				</s:textarea>
				<span class="compeDescError" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
        </div>
    </div>
    <div class="last">
  		 <s:submit class="btn btn-default  active" value="提交竞赛名称申请"></s:submit>
     </div>
     </s:form>
</div>


	
	<%-- <s:form method="post" action="depManager_saveCompeName">
		<s:label>竞赛名称：</s:label><s:textfield name="competitionName.compeName_name"></s:textfield><br/>
		<s:if test="competitionHierarchies == null || competitionHierarchies.size() <= 0">
			<s:label>竞赛等级</s:label><s:select list="#{'0':'暂无比赛等级'}"></s:select><br/>
		</s:if>
		<s:else>
			<s:label>竞赛等级</s:label>
			<s:select name="competitionName.compeName_compeHierarchy.compeHie_id" list="competitionHierarchies" listKey="compeHie_id" listValue="compeHie_name" headerKey="0" headerValue="==请选择竞赛级别=="></s:select><br/>
		</s:else>
		<s:label>竞赛相关描述</s:label><s:textarea name="competitionName.compeName_descr" cols="30" rows="10">
		</s:textarea><br/>
		<s:submit value="提交竞赛名称申请"></s:submit>
	</s:form> --%>
</body>
</html>