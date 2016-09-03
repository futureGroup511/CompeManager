<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>报名表</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
</head>
<body id="body">
		<jsp:include page="operation.jsp"></jsp:include>
		<div class="container-fluid">
			<div class="col-lg-8 col-lg-offset-2">
			<div class="panel panel-default" style="margin-top: 50px">
			<div class="panel-heading">
					<h3 class="panel-title">${comp.compe_compeName.compeName_name }竞赛报名表<span class="text-center text-danger">(请填写完整内容否则报名失败)</span></h3>
			</div>
			<div class="panel-body">
					<form action="student_finishApply" class="form-horizontal" method="post" id="form">
					</form>
					<table class="table-hover table-bordered col-md-12">
						<tbody id="content">
							<tr>
								<td class="col-md-4"><h4 class=" text-lg">学生姓名:</h4></td>
								<td class="col-md-8 "><h4 class="text-lg">${stu.stu_name}</h4>
									<input id="stu_id"  type="text" hidden value="${stu.stu_id}" name="students[0].stu_id" form="form">
									<input type="text" hidden value="${stu.stu_name}" name="students[0].stu_name" form="form">
									<input type="text" hidden value="${stu.stu_num}" name="students[0].stu_num" form="form">
								</td>
							</tr>
							<tr>
								<td class="col-md-4"><h4 class=" text-lg">指导老师:</h4></td>
								<td class="col-md-8 "><input  form="form" required="true"  type="text" class="from-control "  placeholder="指导老师"  name="sup.signUp_teacher" ></td>
							</tr>
							<tr>
								<td class="col-md-4"><h4 class=" text-lg">竞赛名称:</h4></td>
								<td class="col-md-8 "><h4 class="text-lg">${comp.compe_compeName.compeName_name}</h4>
									<input form="form" id="compe_id" type="text" hidden name="compe_id" value="${comp.compe_id }" >
								</td>
							</tr>
							<tr>
								<td class="col-md-4"><h4 class=" text-lg">开始时间 :</h4></td>
								<td class="col-md-8 ">
								<h4 class="text-lg">${comp.compe_startTime}</h4>
								</td>
							</tr>
							<tr>
								<td class="col-md-4"><h4 class=" text-lg">结束时间 :</h4></td>
								<td class="col-md-8 ">
								<h4 class="text-lg">${comp.compe_endTime}</h4>
								</td>
							</tr>
							
							<tr>
								<td class="col-md-4"><h4 class=" text-lg">竞赛类型 :</h4></td>
								<td class="col-md-8 ">
									<s:if test="#request.comp.compe_type==1">
										<input form="form" hidden class="from-control compe_type"  value ="1" type="text" name="sup.singnup_type" readonly="readonly"><label class="control-lable">团队</label>
										</s:if>
										<s:if test="#request.comp.compe_type==2">
												<input form="form" hidden class="from-control compe_type"  value ="2" type="text" name="sup.singnup_type" readonly="readonly"><label class="control-lable">个人</label>
										</s:if>
										
										<s:if test="#request.comp.compe_type==3">
												<input form="form" type="radio" class="from-control compe_type" onclick="jugeCompType(1);" name="sup.singnup_type" value="1"><label class="control-lable">团队</label>
												
												<input form="form" type="radio" class="from-control compe_type"  onclick="jugeCompType(2);"name="sup.singnup_type" value="2"><label class="control-lable">个人</label>
										</s:if>
								</td>
							</tr>
							
							<s:if test="#request.comp.compe_type==1">
								<tr>
									<td class="col-md-4"><h4 class=" text-lg">团队名称:</h4></td>
									<td class="col-md-8">
										<input form="form" id="teammanager" type="text" class="from-control"  placeholder="团队名称" required="required"  placeholder="团队名称" name="sup.signUp_team">
										<button id="addteam" type="button" class="btn btn-primary" onclick="addTeamMember();">添加团队成员</button>
										<label class="control-lable " hidden id="namealready">此团队名已被占用</label>
									</td>
								</tr>
						</s:if>
						<s:if test="#request.comp.compe_type==3">
							<tr class="teamscope">
								<td class="col-md-4"><h4 class=" text-lg">团队名称:</h4></td>
								<td class="col-md-8">
										<input form="form" id="teammanager" type="text" class="from-control"  placeholder="团队名称" required="required"  placeholder="团队名称" name="sup.signUp_team">
										<button id="addteam" type="button" class="btn btn-primary" onclick="addTeamMember();">添加团队成员</button>
										<label class="control-lable " hidden id="namealready">此团队名已被占用</label>
								</td>
							</tr>
					    </s:if>
					    
					    <tr class="teamscope">
					    	<td class="col-md-4"><h4 class=" text-lg">团队负责人:</h4></td>
							<td class="col-md-8">
									<label class="control-lable ">姓名:</label>
									<input form="form" readonly="readonly" class="from-control s_name" value="${stu.stu_name}">
									<label class="control-lable ">学号:</label>
									<input form="form" readonly="readonly" type="text" class="from-control member"  value="${stu.stu_num}" >
							</td>	
					    </tr>
					    
						</tbody>
					
					</table>
					
					    <p id="prompt"  class="text-danger"></p>
						
			</div>
			
			<div class="panel panel-footer">
					<div class="col-md-4 col-md-offset-4">
							<button onclick="form_submit();"  class="btn btn-primary btn-lg btn-block">提交</button>
					</div>
			</div>	
		</div>
		
		</div>
		</div>
		
		
</body>
<script type="text/javascript">
var index=1;
var s_name="";
var s_num="";
var status=1; //1 能提交 不能提交
var num=0;
$(function(){
	
	$(".teamscope").hide();
	/* var teammanager=document.getElementById("teammanager");
	teammanager.disabled="disabled";  */
	//调用On元素的jquery对象DOM对象必须一直存在，否则on函数无效
	/* $("#body").on("change",".s_name",function(){
		
	}); */
	$("#addteam").hide();
	$("#teammanager").change(function(){
		$(".will").empty();
		var teamname=$(this).val();
		var data={
				"sup.signUp_team":teamname
		}
		$.ajax({
			url:"student_jugeTeam",
			type:'post',
			data:data,
			dataType:'json',
			success:function(data){
				if(data=="notexist"){
					$("#addteam").show();
					$("#namealready").hide();
				}else if(data=="exist"){
					$("#addteam").hide();
					$("#namealready").show();
				}
			}
		});
		
	});
	
	
});

function JqValidate()  
{  

		var value=$("input[name='sup.signUp_teacher']").val();
		if(value===""||value===null){
			alert("请填写完整内容")
			return false;
		}else{
			return true;
		}
				
	
} 

 

$(document).on("change",".s_name",function(){
	
	s_name=$(this).val();
	
	VaStudents();
	
});
$(document).on("change",".s_num",function(){
	
	s_num=$(this).val();
	
	VaStudents();

	
});

function jugeCompType(type,async){
	$("#teamnum").hide();
	var teammanager=document.getElementById("teammanager");
	if(async===undefined){
		async=true;	
	}
	var juge=0;
	//竞赛的ID
	var comp_id=$("#compe_id").attr("value");
	//竞赛的类型
	var comp_type=$(".compe_type").attr("value");
	//学生的ID
	var stu_id=$("#stu_id").attr("value");
	
	var data={
			"stu_id":stu_id,
			"compe_id":comp_id,
			"sup.singnup_type":comp_type
	}
	$.ajax({
		url:"student_jugeapply",
		type:'post',
		async:async,
		data:data,
		dataType:'json',
		success:function(data){
			var result=data.split(",");
			if(result[0]==="already"){
				//报过名显示为1
				status=2;
				$("#prompt").text("");
				$("#prompt").text(result[1]+"报过名");
				juge=1;
			}else if(result[0]==="notexist"){
				$("#prompt").text("");
				$("#prompt").text(result[1]+"不存在");
				juge=1;
			}
			else if(result[0]==="success"){
				juge=2;
				$("#prompt").text("");
				$("#prompt").text(result[1]+"可以报名");
				status=1;
				if(type===1){
					$(".teamscope").show();
					$("#addteam").hide();
					$("#teammanager").attr("disabled",false);
					$(".compe_type").attr("value",1);
				}
			}
		}
	});
	
	if(type==2){
		//$("#already").hide();
		$(".teamscope").hide();
		$(".will").empty();
		index=1;
		$("#teammanager").attr("disabled",true);
		$(".compe_type").attr("value",2);
	}
	if(juge===1){
		return false;
	}else if(juge===2){
		return true;
	}
		
		
	
}

function addTeamMember(){
	
	/*  
		<tr class="teamscope">
					    	<td class="col-md-4"><h4 class=" text-lg">团队负责人:</h4></td>
							<td class="col-md-8">
									<label class="control-lable ">姓名:</label>
									<input form="form" readonly="readonly" class="from-control s_name" value="${stu.stu_name}">
									<label class="control-lable ">学号:</label>
									<input form="form" readonly="readonly" type="text" class="from-control member"  value="${stu.stu_num}" >
							</td>	
					    </tr>
	*/
	
		var s= "<tr class='teamscope will'>"	
	        +"<td class='col-md-4'><h4 class=' text-lg'>团队成员:</h4></td>"
			+"<td class='col-md-8'>"
			+"<label class='control-lable '>姓名:</label>"
			+"<input form='form' required='required' class='from-control s_name' placeholder='姓名' name='students["+index+"].stu_name' value>"
			+"<label class='control-lable '>学号:</label>"
			+"<input form='form' required='required' type='text' class='from-control s_num'  placeholder='学号'  name='students["+index+"].stu_num' value>"
			+"</td>	" 
			+"</td>	"
			; 
		s_name="",s_num="";	
		
		
		$("#content").append(s);
		$(".teamscope").show();
		index++;

	
}

	function VaStudents(){
		
		$("#teamnum").hide();
		var data;
		//竞赛的ID
		var comp_id=$("#compe_id").attr("value");
		//竞赛的类型
		var comp_type=$(".compe_type").attr("value");
			if(comp_type==2){
				//学生的ID
				var stu_id=$("#stu_id").attr("value");
				data={
						"stu_id":stu_id,
						"compe_id":comp_id,
						"sup.singnup_type":comp_type
				}
				$.ajax({
					url:"student_jugeapply",
					type:'post',
					data:data,
					dataType:'json',
					success:function(data){
						var result=data.split(",");
						if(result[0]==="already"){
							//报过名显示为1
							status=2;
							alert("此用户已报过名");
							return false;
							
						}else{
							status=1;
						}
						
					}
				});
			}else{
				
				if(s_name!=""&&s_num!=""){
					data={
							"stu_name":s_name,
							"stu_num":s_num,
							"compe_id":comp_id,
							"sup.singnup_type":comp_type
					}
					$.ajax({
						url:"student_jugeapply",
						type:'post',
						data:data,
						dataType:'json',
						success:function(data){
							alert(data);
							var result=data.split(",");
							if(result[0]=="notexist"){
								$("#prompt").text("");
								$("#prompt").text(result[1]+"不存在");
								status=2;
								$("#addteam").hide();
							}else if(result[0]==="already"){
								//报过名显示为1
								$("#prompt").text("");
								$("#prompt").text(result[1]+"报过名");
								status=2;
								$("#addteam").hide();
							} else if(result[0]==="success"){
								//检查团队负责人是否报过名
								if(num==0){
									num++;	
								}
								$("#addteam").show();
								$("#prompt").text("");
								$("#prompt").text(result[1]+"可以报名");
								status=1;
							}
							
						}
					});
					
				} else{
					return false;
				}
			}
			
			
		
	}

	function form_submit(){
		$("#prompt").text("");
		var comp_type=$(".compe_type").attr("value");
		if(comp_type===1){
			if(s_name===""&&s_num===""){
				alert("请填写完整内容");
				return false;
			}
		}
		if(comp_type==2){
			VaStudents();
		}else if(comp_type==1&&num==0){
			$("#teamnum").show();
			return false;
		}
		
		if(status==1){
			if(Boolean(JqValidate())&&Boolean(jugeCompType(0,false))){ 
				   
				 $(".form-horizontal").submit();
			} 
		}
		 
	
	}
	

</script>	
</html>