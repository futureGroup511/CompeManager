<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>菜单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/caidan.css">
</head>
<body id="bg">

<div class="container">
    <div class="leftsidebar_box">
        <div class="line"></div>
        	<c:if test="${sessionScope.stu != null}">
        		<dl class="system_log">
	                <!-- <dt onClick="changeImage()">学生服务<img src="images/select_xl01.png"></dt> -->
	                <dt><a href="student_apply" target="right" style="color:white">报名</a><img src="images/select_xl01.png"></dt>
	                <dt><a href="student_lookApplyStatus" target="right" style="color:white">报名状态</a><img src="images/select_xl01.png"></dt>
	                <dt><a href="student_lookAward" target="right" style="color:white">获奖记录</a><img src="images/select_xl01.png"></dt>
	                <dt><a href="student_lookPersonInfo" target="right" style="color:white">查看个人信息</a><img src="images/select_xl01.png"></dt>
	                
	                
	                
          	  	</dl>
        	</c:if>
        	
        	<c:if test="${sessionScope.depManager != null}">
        		<dl class="custom">
	                <dt>申报竞赛<img src="images/select_xl01.png"></dt>
	                <dd><a target="right" href="depManager_applyCompeName">申报竞赛名称</a></dd>
	                <dd><a target="right" href="depManager_applyCompetitionPage">申报竞赛</a></dd>
	            </dl>
	            
	            <dl class="custom">
	                <dt>查询<img src="images/select_xl01.png"></dt>
	                <dd><a target="right" href="depManager_seeAllApplyCompNames">竞赛名称审核状态</a></dd>
	                <dd><a target="right" href="depManager_seeAllApplyCompetition">竞赛审核状态</a></dd>
	            </dl>
	            
	            <dl class="custom">
	                <dt>主要功能<img src="images/select_xl01.png"></dt>
	               	<dd><a target="right" href="depManager_lookProcessingCompetitionStatus">竞赛报名情况</a></dd>
	                <dd><a target="right" href="depManager_inspectStudentApplyPage">审核报名</a></dd>
	                <dd><a target="right" href="depManager_registerScoreToDb">录入竞赛成绩</a></dd>
	                <dd><a target="right" href="awardRecord_alertAwardRecordUI.action">修改获奖信息</a></dd>
	                <dd><a target="right" href="depManager_nextClassCompetition">继续下级比赛</a></dd>
	            </dl>
	            
	            <dl class="custom">
	                <dt>查询获奖情况<img src="images/select_xl01.png"></dt>
		            <dd><a target="right" href="department_findAllAwardRecord.action">本院学生获奖情况</a></dd>
		            <dd><a target="right" href="department_findAllDeCoAwardRecord.action">竞赛获奖情况</a></dd>
	            </dl>
	            <dl class="custom">
                <dt>通知<img src="images/select_xl01.png"></dt>
                <dd><a target="right" href="depManager_sendInformView">发布通知</a></dd>
	           	<dd><a href="depManager_lookInformView" target="right">查看通知</a></dd>
	            </dl>   
	            
        	</c:if>
				
			<c:if test="${sessionScope.admin != null}">
				<dl class="channel">
	                <dt>审核<img src="images/select_xl01.png"></dt>
	                <dd><a href="competitionName_checkNoName.action" target="right">待审核竞赛名称</a></dd>
	                <dd class="first_dd"><a href="admin_checkNoProject.action" target="right">待审核竞赛项目</a></dd>
	                <dd><a href="awardRecord_checkNoCompetition.action" target="right">待审核竞赛</a></dd>
	            </dl>
	            
	            <dl class="channel">
	                <dt>查询竞赛名称<img src="images/select_xl01.png"></dt>
	                <dd><a href="competitionName_checkSuccessName.action" target="right">通过</a></dd>
	                <dd><a href="competitionName_noPassCheck.action" target="right">未通过</a></dd>
	            </dl>
	            
	        	<dl class="channel">
	                <dt>查询竞赛<img src="images/select_xl01.png"></dt>
	                <dd><a href="admin_checkSuccessProject.action" target="right">正在进行</a></dd>
	                <dd><a href="admin_noPassCheck.action" target="right">未通过</a></dd>
	            </dl>
	            
	            <dl class="channel">
	                <dt>竞赛审核结果<img src="images/select_xl01.png"></dt>
	                <dd><a href="awardRecord_checkSuccessAwardRecord.action" target="right">审核通过</a></dd>
	                <dd><a href="awardRecord_noPassCheckAwardRecord.action" target="right">审核未通过</a></dd>
	            </dl>
	            
	            <dl class="channel">
	                <dt><a href="awardRecord_findAllAwardRecord.action" style="color:white" target="right">查询获奖情况</a><img src="images/select_xl01.png"></dt>
	            </dl>
	            
	            <dl class="channel">
	                <dt><a href="admin_menu" target="right" style="color:white">信息管理</a><img src="images/select_xl01.png"></dt>
	            </dl>
	            <dl class="channel">
	                <dt><a href="admin_doCounterJob" style="color:white">导出数据</a><img src="images/select_xl01.png"></dt>
	            </dl>
        	</c:if>
				
			<dl class="system_log">
                <dt onClick="if(confirm( '确定要退出吗！ ')==false)return   false;"><a href="loginControll_loginOut" style="color:white">退出登陆</a><img src="images/select_xl01.png"></dt>
            </dl>	
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
$(".leftsidebar_box dt").css({"background-color":"#1E68B5"});
$(".leftsidebar_box dt img").attr("src","images/select_xl01.png");
$(function(){
    $(".leftsidebar_box dd").hide();
    $(".leftsidebar_box dt").click(function(){
        $(".leftsidebar_box dt").css({"background-color":"#1E68B5"})
        $(this).css({"background-color": "#238AE3"});
        $(this).parent().find('dd').removeClass(("menu_chioce"),6000);
        $(".leftsidebar_box dt img").attr("src","images/select_xl01.png");
        $(this).parent().find('img').attr("src","images/select_xl01.png");
        $(".menu_chioce").slideUp();
        $(this).parent().find('dd').slideToggle();
    $(this).parent().find('dd').addClass("menu_chioce");
})
})
</script>
</body>
</html>