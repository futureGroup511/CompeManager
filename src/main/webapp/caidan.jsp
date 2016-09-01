<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>caidan</title>
    <link rel="stylesheet" href="css/caidan.css">
</head>
<body id="bg">

<div class="container">

    <div class="leftsidebar_box">
        <div class="line"></div>
           <dl class="system_log">
                <dt onClick="changeImage()">学生服务<img src="images/select_xl01.png"></dt>
                <dd class="first_dd"><a href="#">报名</a></dd>
                <dd><a href="#">报名状态</a></dd>
                <dd><a href="#">获奖记录</a></dd>
            </dl>
        
            <dl class="custom">
                <dt onClick="changeImage()">学院负责人服务<img src="images/select_xl01.png"></dt>
                <dd class="first_dd"><a href="#">申报项目名称</a></dd>
                <dd><a href="#">申报项目名称审核状态</a></dd>
                <dd><a href="#">申报项目</a></dd>
                <dd class="first_dd"><a href="#">申报项目状态</a></dd>
                <dd><a href="#">审核报名</a></dd>
                <dd><a href="#">选择比赛进入下一阶段</a></dd>
                <dd><a href="#">录入成绩</a></dd>
            </dl>
        
            <dl class="channel">
                <dt>教务处服务<img src="images/select_xl01.png"></dt>
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
            </dl>
    </div>

</div>

<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
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