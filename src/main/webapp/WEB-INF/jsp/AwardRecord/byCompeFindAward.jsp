<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>待审核竞赛结果</title>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 begin -->
<script type='text/javascript' src='ly/js/jquery.js'></script>
<script type='text/javascript' src='ly/js/jquery.scripts.js'></script>
<script type='text/javascript' src='ly/js/jquery.custom.js'></script>
<!-- 去掉这3行，则点击直接显示原图，如果移动至下面则IE浏览器报错 end -->
<link rel="stylesheet" type="text/css" media="all" href="ly/css/style.min.css" />

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/jiao7.css">
</head>

<body>

<%-- <s:select name="user.sex" list="awardRecords" label="dd" listKey="awardRecor_competition.compe_compeName.compeName_id" listValue='awardRecor_competition.compe_compeName.compeName_name' headerKey="" headerValue=""></s:select>  
 --%>


<div class="container">
  <div class="row">
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>查看待审核竞赛结果</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name}  登录本系统</p>
        </div>
  </div>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-hover table-striped">
    <thead>
      <tr class="two">
         <th>#</th>
         <th>学号</th>
         <th>姓名</th>
         <th>性别</th>
         <th>班级</th>
         <th>比赛</th>
         <th>老师</th>
         <th>团队名称</th>
         <th>负责人</th>
         <th>等级</th>
         <th>学分</th>
         <th>奖金</th>
         <th>老师奖金</th>
         <th>发奖单位</th>
         <th>证书</th>
         <th>编辑</th>
       </tr>
      </thead>
      <tbody>
      <s:if test="recordList.size == 0">
      	当前竞赛已经结束，但竞赛院系还未处理好竞赛结果。
      </s:if>
       <s:iterator value="recordList" status="st">
			<tr>
				<s:hidden name="awardRecor_id"></s:hidden>
				<td>${st.index+1 }</td>
				<td>${awardRecor_student.stu_num }</td>
				<td>${awardRecor_student.stu_name }</td>
				<td>${awardRecor_student.stu_sex }</td>
				<td>${awardRecor_student.stu_class }</td>
				<td>${awardRecor_competition.compe_compeName.compeName_name }</td>
				<td>${awardRecor_coachTeacher }</td>
				<s:if test="awardRecor_team ==null ">
					<td>----------</td>
					<td>----------</td>
				</s:if>
				<s:else>
					<td>${awardRecor_team }</td>
					
					<s:if test="awardRecor_manager == 1">
						<td>是</td>
					</s:if>
					<s:else>
						<td>否</td>
					</s:else>
				</s:else>
				<td>${awardRecor_awadHie.awardHie_name }</td>
				<td>${awardRecor_score }</td>
				<td>${awardRecor_stuMoney }</td>
				<td>${awardRecor_teaMoney }</td>
				<td title="${awardRecor_unit }">
					${fn:substring(awardRecor_unit,0,5)}……
				</td>
				<td>
					<s:if test="awardRecor_picturePath == ''">
				未上传
				</s:if>
				<s:else>
					<a class="image-icon" rel="gallery[modal]" href="${awardRecor_picturePath }">
					<img height="20" width="100" src="${awardRecor_picturePath }"></a>
				</s:else>
				</td>
				<td>
					<a href="awardRecord_pass?id=${awardRecor_id }&compeId=${awardRecor_competition.compe_id}&pageNum=${pageNum }">通过</a>
					<a href="#" onclick="disp_prompt(${awardRecor_id },${awardRecor_competition.compe_id})">未通过</a>
				</td>
			</tr>
	</s:iterator>
       
      </tbody>
    </table>
</div>   

<div class="container">
  <div class="row">
   <div class="col-lg-5 col-lg-offset-5 col-md-5 col-md-offset-4 col-xs-5 col-xs-offset-4">
           <p class="xixnxi">每页显示${pageSize }条，总记录数${recordCount }条</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-5 col-lg-offset-5 col-md-6 col-md-offset-4 col-xs-6 col-xs-offset-4">
           <nav>
          <ul class="pagination">
            </li>
            <li><a href="javascript:gotoPage(1,${recordList[0].awardRecor_competition.compe_id })">首页</a></li>
            <li><a href="javascript:gotoPage(${pageNum }-1,${recordList[0].awardRecor_competition.compe_id })">上一页</a></li>
            <li><a href="#">${currentPage }/${pageCount }</a></li>
            <li><a href="javascript:gotoPage(${pageNum }+1,${recordList[0].awardRecor_competition.compe_id })">下一页</a></li>
            <li><a href="javascript:gotoPage(${pageCount },${recordList[0].awardRecor_competition.compe_id })">尾页</a></li>
            </li>
          </ul>
        </nav>
        </div>
      </div>
</div>
<script type="text/javascript">
	function gotoPage(pageNum,compeId){
		if(pageNum > "${pageCount}"){
			pageNum = "${pageCount}"
		}
		if(pageNum < 1){
			pageNum = 1;
		}	
		window.location.href="awardRecord_byCompeFindAward?id="+ compeId + "&pageNum=" + pageNum;
}			
	
	//<a href="awardRecord_pass?id=${awardRecor_id }&compeId=${awardRecor_competition.compe_id}&pageNum=${pageNum }">通过</a>
	function disp_prompt(awardRecor_id,compeId){
		var id = awardRecor_id;
		var name = prompt("请输入未通过原因")
		var name1 = window.encodeURI(window.encodeURI(name)); 
		if (name!=null && name!=""){
			window.location.href="awardRecord_noPass?id=" + id + "&reason="+name1 + "&compeId=" + compeId;
		}
	}
</script>
</body>
</html>
