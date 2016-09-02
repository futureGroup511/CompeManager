<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>caidan</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/caidan.css">
</head>
<body id="bg">

<div class="container">

    <div class="leftsidebar_box">
        <div class="line"></div>
        	<c:if test="${sessionScope.stu != null}">
        		<dl class="system_log">
                <dt onClick="changeImage()">学生服务<img src="images/select_xl01.png"></dt>
                <dd class="first_dd"><a href="student_apply" target="right">报名</a></dd>
                <dd><a href="student_lookApplyStatus" target="right">报名状态</a></dd>
                <dd><a href="student_lookAward" target="right">获奖记录</a></dd>
            </dl>
<<<<<<< HEAD
        
            <!-- <dl class="custom">
                <dt onClick="changeImage()">学院负责人服务<img src="images/select_xl01.png"></dt>
                <dd class="first_dd"><a href="#">申报项目名称</a></dd>
                <dd><a href="#">申报项目名称审核状态</a></dd>
                <dd><a href="#">申报项目</a></dd>
                <dd class="first_dd"><a href="#">申报项目状态</a></dd>
                <dd><a href="#">审核报名</a></dd>
                <dd><a href="#">选择比赛进入下一阶段</a></dd>
                <dd><a href="#">录入成绩</a></dd>
            </dl> -->
        
           <dl class="channel">
           		<dt>教务处服务<img src="images/select_xl01.png"></dt>
=======
        	</c:if>
        		
        	
        	<c:if test="${sessionScope.depManager != null}">
        		<dl class="custom">
	                <dt onClick="changeImage()">学院负责人服务<img src="images/select_xl01.png"></dt>
	                <dd class="first_dd"><a href="#">申报项目名称</a></dd>
	                <dd><a href="#">申报项目名称审核状态</a></dd>
	                <dd><a href="#">申报项目</a></dd>
	                <dd class="first_dd"><a href="#">申报项目状态</a></dd>
	                <dd><a href="#">审核报名</a></dd>
	                <dd><a href="#">选择比赛进入下一阶段</a></dd>
	                <dd><a href="#">录入成绩</a></dd>
	            	 <dd><a href="depManager_sendInformView">发布通知</a></dd>
	            </dl>
        	</c:if>
				
			<c:if test="${sessionScope.admin != null}">
        			<dl class="channel">
                <dt>教务处服务<img src="images/select_xl01.png"></dt>
>>>>>>> 7eacff2382ea2dcffec0121e0b2e807ebe6220a8
                <dd class="first_dd"><a href="admin_checkNoProject.action" target="right">待审核竞赛项目</a></dd>
                <dd><a href="admin_checkSuccessProject.action" target="right">正在进行竞赛项目</a></dd>
                <dd><a href="admin_noPassCheck.action" target="right">未通过审核竞赛项目</a></dd>
                <dd><a href="competitionName_checkNoName.action" target="right">待审核竞赛名称</a></dd>
                <dd><a href="competitionName_checkSuccessName.action" target="right">审核通过竞赛名称</a></dd>
                <dd><a href="competitionName_noPassCheck.action" target="right">未通过审核竞赛名称</a></dd>
                <dd><a href="awardRecord_checkNoAwardRecord.action" target="right">待审核竞赛结果</a></dd>
                <dd><a href="awardRecord_checkSuccessAwardRecord.action" target="right">审核通过结果</a></dd>
                <dd><a href="awardRecord_noPassCheckAwardRecord.action" target="right">未通过审核竞赛结果</a></dd>
                <dd><a href="awardRecord_findAllAwardRecord.action" target="right">学生获奖情况</a></dd>
            	<dd><a href="admin_findAll" target="right">查看所有学院负责人</a> </dd>
           		<dd><a href="admin_addDeparmentManegerView" target="right">添加学院负责人</a></dd>
           		<dd><a href="admin_findAllStudent" target="right">查看所有学生</a></dd>
            	<dd><a href="admin_finAllDepartment" target="right">查看所有学院</a></dd>
           		<dd><a href="admin_addDepartmentView" target="right">添加学院</a></dd>
            	<dd><a href="comphier_findAllcomphier" target="right">查看所有竞赛等级</a></dd>
           		<dd><a href="admin_addCompetitionHierarchyView" target="right">添加竞赛等级</a></dd>
            	<dd><a href="awardhierar_findAll" target="right">查看所有获奖等级</a></dd>
           		<dd><a href="admin_addAwardHierarchyView" target="right">添加获奖等级</a></dd>
            	<dd><a href="awardstand_findAll" target="right">查看所有奖励标准</a></dd>
            	<dd><a href="admin_addAwardStandView" target="right">添加奖励标准</a></dd>
            </dl>
<<<<<<< HEAD
             <dl class="channel">
                <dt>学院负责人<img src="images/select_xl01.png"></dt>
               	<dd><a target="right" href="depManager_lookProcessingCompetitionStatus">查看正在进行项目的报名情况</a></dd>
                <dd><a target="right" href="depManager_applyCompeName">申报项目名称</a></dd>
                <dd><a target="right" href="depManager_seeAllApplyCompNames">查看申报项目名称审核状态</a></dd>
                <dd><a target="right" href="depManager_applyCompetitionPage">申报项目</a></dd>
                <dd><a target="right" href="depManager_seeAllApplyCompetition">查看申报项目审核状态</a></dd>
                <dd><a target="right" href="depManager_inspectStudentApplyPage">审核报名</a></dd>
                <dd><a target="right" href="depManager_nextClassCompetition">继续下级比赛</a></dd>
                <dd><a target="right" href="depManager_registerScoreToDb">录入竞赛成绩</a></dd>
            </dl>
=======
        	</c:if>
					
			
>>>>>>> 7eacff2382ea2dcffec0121e0b2e807ebe6220a8
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