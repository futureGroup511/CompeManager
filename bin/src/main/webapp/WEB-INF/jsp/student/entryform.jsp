<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html >
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
		
		<div class="panel panel-default" style="margin-top: 50px">
			<div class="panel-heading">
					<h3 class="panel-title">${comp.compe_compeName.compeName_name }竞赛报名表</h3>
			</div>
			<div class="panel-body">
					<form action="student_finishApply" class="form-horizontal" method="post" id="form">
						<div class="form-group">
							<label class="control-lable col-md-1">学生姓名:</label>
							<div class="col-md-4">
								<label class="control-lable">${stu.stu_name}</label>
								<input id="stu_id"  type="text" hidden value="${stu.stu_id}" name="students[0].stu_id">
								<input type="text" hidden value="${stu.stu_name}" name="students[0].stu_name">
								<input type="text" hidden value="${stu.stu_num}" name="students[0].stu_num">
							</div>
						</div>
						<div class="form-group">
							<label class="control-lable col-md-1">指导老师:</label>
							<div class="col-md-4">
								<input  type="text" class="from-control"  placeholder="指导老师"  name="sup.signUp_teacher" required="required">
							</div>
						</div>
						<div class="form-group">
							<label class="control-lable col-md-1">竞赛的名称:</label>
							<div class="col-md-4">
								<label class="control-lable">${comp.compe_compeName.compeName_name}</label>
								<input id="compe_id" type="text" hidden name="compe_id" value="${comp.compe_id }" >
							</div>
						</div>
						<div class="form-group">
							<label class="control-lable col-md-1">开始时间:</label>
							<div class="col-md-4">
								<label class="control-lable">${comp.compe_startTime}</label>
							</div>
						</div>
						<div class="form-group">
							<label class="control-lable col-md-1">结束时间:</label>
							<div class="col-md-4">
								<label class="control-lable">${comp.compe_endTime}</label>
							</div>
						</div>
						<div   class="form-group">
							<label class="control-lable col-md-1">竞赛类型:</label>
							
							<div class="col-md-4">
								<s:if test="#request.comp.compe_type==1">
										<input hidden class="from-control compe_type"  value ="1" type="text" name="sup.signUP_type" readonly="readonly"><label class="control-lable">团队</label>
								</s:if>
								<s:if test="#request.comp.compe_type==2">
										<input hidden class="from-control compe_type"  value ="2" type="text" name="sup.signUP_type" readonly="readonly"><label class="control-lable">个人</label>
								</s:if>
								
								<s:if test="#request.comp.compe_type==3">
										<input type="radio" class="from-control compe_type" onclick="jugeCompType(1,this);" name="sup.signUP_type" value="1"><label class="control-lable">团队</label>
										
										<input type="radio" class="from-control compe_type"  onclick="jugeCompType(2,this);"name="sup.signUP_type" value="2"><label class="control-lable">个人</label>
								</s:if>
								
							</div>
						</div>
						
						<s:if test="#request.comp.compe_type==1">
							<div class="form-group">
								<label class="control-lable col-md-1">团队名称:</label>
								<div class="col-md-4">
									<input id="teammanager" type="text" class="from-control"  placeholder="团队名称" required="required"  placeholder="团队名称" name="sup.signUp_team">
									<button id="addteam" type="button" class="btn btn-primary" onclick="addTeamMember();">添加团队成员</button>
									<label class="control-lable " hidden id="namealready">此团队名已被占用</label>
								</div>
								
							</div>
						</s:if>
						<s:if test="#request.comp.compe_type==3">
							<div  class="form-group teamscope">
									<label class="control-lable col-md-1">团队名称:</label>
									<div class="col-md-4">
										<input id="teammanager" type="text" class="from-control"  placeholder="团队名称" required="required"  placeholder="团队名称" name="sup.signUp_team">
										<button id="addteam" type="button" class="btn btn-primary" onclick="addTeamMember();">添加团队成员</button>
										<label class="control-lable " hidden id="namealready">此团队名已被占用</label>
									</div>
						    </div>
					    </s:if>
					    <div class="form-group teamscope">
					    
					    	<label class="control-lable col-md-1">团队负责人:</label>
								<div class="col-md-4">
									<label class="control-lable ">姓名:</label>
									<input readonly="readonly" class="from-control s_name" value="${stu.stu_name}">
									<label class="control-lable ">学号:</label>
									<input readonly="readonly" type="text" class="from-control member"  value="${stu.stu_num}" >
								</div>
					    </div>
						
					</form>
			</div>
			<p id="already" hidden class="text-danger">此用户已经报过名</p>
			<p id="notexist" hidden class="text-danger">此用户不存在</p>
			<p id="success" hidden class="text-success">此用户可报名</p>
			<div class="panel panel-footer">
					<div class="col-md-4 col-md-offset-4">
							<button onclick="form_submit();"  class="btn btn-primary btn-lg btn-block">提交</button>
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
    return $("#form").validate({  
				rules:{
					signUp_teacher:"required",
					stu_name:"required",
					stu_num:"required",
					signUP_type:"required",
				}
				
    });  
} 

 

$(document).on("change",".s_name",function(){
	
	s_name=$(this).val();
	
	VaStudents();
	
});
$(document).on("change",".s_num",function(){
	
	s_num=$(this).val();
	
	VaStudents();

	
});

function jugeCompType(type,arr){
	var teammanager=document.getElementById("teammanager");
	if(type==1){

		var data;
		//竞赛的ID
		var comp_id=$("#compe_id").attr("value");
		//竞赛的类型
		var comp_type=$(".compe_type").attr("value");
		//学生的ID
		var stu_id=$("#stu_id").attr("value");
		
				data={
						"stu_id":stu_id,
						"compe_id":comp_id,
						"sup.signUP_type":comp_type
				}
				$.ajax({
					url:"student_jugeapply",
					type:'post',
					data:data,
					dataType:'json',
					success:function(data){
						if(data!=null){
							//报过名显示为1
							status=2;
							$("#already").show();
							return false;
							
						}else{
							$("#already").hide();
							status=1;
							$(".teamscope").show();
							$("#addteam").hide();
							$("#teammanager").attr("disabled",false);
							$(".compe_type").attr("value",1);
						}
						
					}
				});
		
	}else if(type==2){
		$(".teamscope").hide();
		$("#teammanager").attr("disabled",true);
		$(".compe_type").attr("value",2);
	}
}

function addTeamMember(){
	
		var s= 		"<div class='form-group teamscope'>"	
	        +"<label class='control-lable col-md-1'>团队成员:</label>"
			+"<div class='col-md-4'>"
			+"<label class='control-lable '>姓名:</label>"
			+"<input required='required' class='from-control s_name' placeholder='姓名' name='students["+index+"].stu_name' value>"
			+"<label class='control-lable '>学号:</label>"
			+"<input required='required' type='text' class='from-control s_num'  placeholder='学号'  name='students["+index+"].stu_num' value>"
			+"</div>" 
			+"</div>"
			; 
		s_name="",s_num="";	
		if(num==0){
			num++;	
		}
		$(".form-horizontal").append(s);
		index++;

	
}

	function VaStudents(){
		
		
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
						"sup.signUP_type":comp_type
				}
				$.ajax({
					url:"student_jugeapply",
					async:false,
					type:'post',
					data:data,
					dataType:'json',
					success:function(data){
						if(data!=null){
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
							"sup.signUP_type":comp_type
					}
					$.ajax({
						url:"student_jugeapply",
						type:'post',
						data:data,
						dataType:'json',
						success:function(data){
							if(data=="notexist"){
								$("#already").hide();
								$("#notexist").show();
								$("#success").hide();
								status=2;
								$("#addteam").hide();
								return false;
							}else if(data!=null){
								//报过名显示为1
								$("#notexist").hide();
								$("#already").show();
								$("#success").hide();
								status=2;
								$("#addteam").hide();
								return false;
							} else{
								$("#addteam").show();
								$("#notexist").hide();
								$("#already").hide();
								status=1;
								$("#success").show();
							}
							
						}
					});
					
				} else{
					return false;
				}
			}
			
			
		
	}

	function form_submit(){
		var comp_type=$(".compe_type").attr("value");
		if(comp_type==2){
			VaStudents();
		}else if(comp_type==1&&num==0){
			alert("团队赛报名人数必须两名以上");
			return false;
		}
	
		if(status==1){
			if(JqValidate()){    
				 $(".form-horizontal").submit();
				     } 
		}
		 
	
	}
	

</script>	
</html>