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
	<title>申请竞赛</title>
	<script src="${pageContext.request.contextPath}/JQueryResources/laydate/laydate.js"></script>
	<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" />
	<link rel="stylesheet" href="<%=basePath %>css/xueyuan3.css" />
	<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
	<script src="<%=basePath %>js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>jQuery-validator/jquery-1.11.1.js"></script>
<%-- <script type="text/javascript" src="<%=basePath %>JQueryResources/fixError.js"></script> --%>
	<script src="<%=basePath %>js/bootstrap.js"></script>
	<script type="text/javascript">
	
		$(function(){
			$(".btn").click(function(){
				

				$(".zsCompeDep").css("display", 'none');
				$(".zsCompeReqTime").css("display", 'none');
				$(".zsCompeStaTime").css("display", 'none');
				$(".zsCompeEndTime").css("display", 'none');
				$(".zsCompeMoney").css("display", 'none');
				$(".zsCompeType").css("display", 'none');
				$(".zsCompeName").css("display", 'none');
				$(".zsCompeDesc").css("display", 'none');
				//alert(1);
				var compeDep = $(".compeDep").val();
				var compeReqTime= $(".compeReqTime").val();
				var compeStaTime  = $(".compeStaTime").val();
				var compeEndTime = $(".compeEndTime").val();  
				var compeMoney = $(".compeMoney").val();      
				var compeType= $(".compeType option:selected").val();       
				var compeName = $(".compeName option:selected").val();      
				var compeDesc= $(".compeDesc").val();
				if(compeDep==null ||compeDep.trim() ==""){
					$(".zsCompeDep").css("display", 'inline');
					return false;
				}
				if(compeReqTime==null || compeReqTime.trim()==""){
					$(".zsCompeReqTime").css("display", 'inline');
					return false;
				}
				if(compeStaTime==null || compeStaTime.trim()==""){
					$(".zsCompeStaTime").css("display", 'inline');
					return false;
				}
				if(compeEndTime==null || compeEndTime.trim()==""){
					$(".zsCompeEndTime").css("display", 'inline');
					return false;			
				}
				if(compeMoney==null||compeMoney.trim()==""){
					$(".zsCompeMoney").css("display", 'inline');
					return false;
				}
				if(compeType==null||compeType==0){
					$(".zsCompeType").css("display", 'inline');
					return false;
				}
				if(compeName==null || compeName==0){
					$(".zsCompeName").css("display", 'inline');
					return false;
				}
				if(compeDesc==null || compeDesc==""){
					$(".zsCompeDesc").css("display", 'inline');
					return false;
				}
				/* alert(compeDep);
				alert(compeReqTime);
				alert(compeStaTime);
				alert(compeEndTime); 
				alert(compeType);
				alert(compeName);
				alert(compeMoney);
				alert(compeDesc);
				*/
				return true;
			});
		})
	</script>
</head>
<body>
	<div class="dangqian">
    		<div class="row">
		        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
		            <p>当前位置：学院负责人>>申请竞赛</p>
		        </div>
		        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
		            <p>欢迎 	${sessionScope.depManager.depM_name }  登录本系统</p>
		        </div>
    		</div>
		</div>
		<div class="container">
<%-- <s:form method="post" action="depManager_saveApplyCompetition" enctype="multipart/form-data">
	<div class="one">
	
    	<div class="row">
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛负责人</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            <s:textfield class="compeDep form-control" name="compe_manager"></s:textfield>
            <span class="zsCompeDep" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
             </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛申报时间</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            <s:textfield name="compe_requestDate" placeholder="请输入日期" class="compeReqTime laydate-icon form-control" onclick="laydate()"></s:textfield>
            <span class="zsCompeReqTime" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div> 
        </div>
    </div>
    <div class="two">
    	<div class="row">
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛开始时间</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            <s:textfield name="compe_startTime" placeholder="请输入日期" class="compeStaTime laydate-icon form-control" onclick="laydate()"></s:textfield>
            <span class="zsCompeStaTime" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛结束时间</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield name="compe_endTime" placeholder="请输入日期" class="compeEndTime laydate-icon form-control" onclick="laydate()"></s:textfield>
            	<span class="zsCompeEndTime" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
        </div>
    </div>
    <div class="three">
    	<div class="row">
        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>所用经费</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield name="compe_money" class="compeMoney form-control"></s:textfield>
            	<span class="zsCompeMoney" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>所申报学院</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            <s:textfield readonly="true" class="form-control"  value="%{#session.depManager.depM_department.de_name}"></s:textfield>
            </div>
        </div>
    </div>
    <div class="four">
    	<div class="row">
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛类型</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
           		 <s:select class="compeType form-control" list="#{'0':'==请选择==','1':'团体', '2':'个人', '3':'团体/个人' }" name="compe_type"></s:select>
           		 <span class="zsCompeType" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
            <div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛名称</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:select class="compeName form-control" list="competitionNames" listKey="compeName_id" listValue="compeName_name" name="compe_compeName.compeName_id" headerKey="0" headerValue="==选择竞赛名称=="></s:select>
            	<span class="zsCompeName" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
        </div>
     </div>
     <div class="six">
     	<div class="col-lg-9  col-md-offset-1">
     	竞赛描述：
     	<s:textarea class="compeDesc form-control" name="compe_digest" rows="5"></s:textarea>
     	<span class="zsCompeDesc" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
        </div>
     </div>
     <div class="five">
        <div class="row">
            <div class="col-lg-1 col-md-2  col-xs-2 col-xs-offset-1"><p>竞赛方案</p></div>
            <div class="col-lg-1 col-lg-offset-1 col-md-1  col-xs-1 col-xs-offset-1">
            	<s:file class="btn btn-default  active" name="compeProgramFile"></s:file>
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-3 col-xs-offset-1"><a style="display:none">未选择任何文件</a></div>
         </div>
     </div>
     <div class="last">
     	<s:submit value="提交竞赛申请" class="btn btn-default  active"></s:submit>
     </div>
 </s:form> --%>
 <s:form method="post" action="depManager_saveApplyCompetition" enctype="multipart/form-data">
	<div class="one">
	
    	<div class="row">
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛负责人</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            <s:textfield class="compeDep form-control" name="compe_manager"></s:textfield>
            <span class="zsCompeDep" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
             </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛申报时间</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            <s:textfield name="compe_requestDate" placeholder="请输入日期" class="compeReqTime laydate-icon form-control" onclick="laydate()"></s:textfield>
            <span class="zsCompeReqTime" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div> 
        </div>
    </div>
    <div class="two">
    	<div class="row">
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛开始时间</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            <s:textfield name="compe_startTime" placeholder="请输入日期" class="compeStaTime laydate-icon form-control" onclick="laydate()"></s:textfield>
            <span class="zsCompeStaTime" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
            <div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛结束时间</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield name="compe_endTime" placeholder="请输入日期" class="compeEndTime laydate-icon form-control" onclick="laydate()"></s:textfield>
            	<span class="zsCompeEndTime" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
        </div>
    </div>
<div class="three">
    	<div class="row">
        	<div class="col-lg-2  col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>所用经费</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:textfield name="compe_money" class="compeMoney form-control"></s:textfield>
            	<span class="zsCompeMoney" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>所申报学院</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            <s:textfield readonly="true" class="form-control"  value="%{#session.depManager.depM_department.de_name}"></s:textfield>
            </div>
        </div>
    </div>
    <div class="four">
    	<div class="row">
        	<div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛类型</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
           		 <s:select class="compeType form-control" list="#{'0':'==请选择==','1':'团体', '2':'个人', '3':'团体/个人' }" name="compe_type"></s:select>
           		 <span class="zsCompeType" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
            <div class="col-lg-2 col-md-2 col-md-offset-1 col-xs-2 col-xs-offset-1"><p>竞赛名称</p></div>
            <div class="col-lg-3 col-md-3 col-xs-3">
            	<s:select class="compeName form-control" list="competitionNames" listKey="compeName_id" listValue="compeName_name" name="compe_compeName.compeName_id" headerKey="0" headerValue="==选择竞赛名称=="></s:select>
            	<span class="zsCompeName" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
            </div>
        </div>
     </div>
     <div class="six">
     	<div class="col-lg-9  col-md-offset-1">
     	竞赛描述：
     	<s:textarea class="compeDesc form-control" name="compe_digest" rows="5"></s:textarea>
     	<span class="zsCompeDesc" style="display:none;color:red;font-size:20px;">请填写此项内容</span>
        </div>
     </div>
     <div class="five">
        <div class="row">
            <div class="col-lg-1 col-md-2  col-xs-2 col-xs-offset-1"><p>竞赛方案</p></div>
            <div class="col-lg-1 col-lg-offset-1 col-md-1  col-xs-1 col-xs-offset-1">
            	<s:file class="btn btn-default  active" name="compeProgramFile"></s:file>
            </div>
            <div class="col-lg-2 col-lg-offset-1 col-md-2 col-md-offset-1 col-xs-3 col-xs-offset-1"><a style="display:none">未选择任何文件</a></div>
         </div>
     </div>
     <div class="last">
     	<s:submit value="提交竞赛申请" class="btn btn-default  active"></s:submit>
     </div>
 </s:form>
 
</div>
























	<%-- <s:form method="post" action="depManager_saveApplyCompetition" enctype="multipart/form-data">
		竞赛负责人:<s:textfield name="compe_manager"></s:textfield><br/>
		竞赛申报时间: <s:textfield name="compe_requestDate" placeholder="请输入日期" class="laydate-icon" onclick="laydate()"></s:textfield><br/>
		竞赛开始时间：<s:textfield name="compe_startTime" placeholder="请输入日期" class="laydate-icon" onclick="laydate()"></s:textfield><br/>
		竞赛结束时间<s:textfield name="compe_endTime" placeholder="请输入日期" class="laydate-icon" onclick="laydate()"></s:textfield><br/>
		所需经费：<s:textfield name="compe_money"></s:textfield><br/>
		竞赛类型：<s:select list="#{'0':'==请选择==','1':'团体', '2':'个人', '3':'团体/个人' }" name="compe_type"></s:select><br/>
		竞赛名称：<s:select list="competitionNames" listKey="compeName_id" listValue="compeName_name" name="compe_compeName.compeName_id"></s:select><br/>
		<s:label for="">所申报学院：</s:label><s:textfield readonly="true"  value="%{#session.depManager.depM_department.de_name}"></s:textfield><br/>
				<s:textfield name="compe_department.de_id" type="hidden" value="%{#session.depManager.depM_department.de_id}"></s:textfield><br/>
		<s:label for="">竞赛方案：</s:label><s:file name="compeProgramFile"></s:file><br/>
		<s:textarea name="compe_digest" cols="40" rows="25"></s:textarea><br/>
		<s:submit value="提交竞赛申请"></s:submit>
	</s:form> --%>
</body>
</html>