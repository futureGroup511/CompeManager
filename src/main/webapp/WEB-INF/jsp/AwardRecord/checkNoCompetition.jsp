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
<title>查询要审核的竞赛</title>
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
        <div class="col-lg-4 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>当前位置：教务处服务>>待审核竞赛</p>
        </div>
        <div class="col-lg-3 col-lg-offset-4 col-md-2 col-md-offset-4 col-xs-2  col-xs-offset-4 ">
            <p>欢迎 	${sessionScope.admin.ad_name }  登录本系统</p>
        </div>
    </div>
</div>
<div class="container">
 <div class="row">
 <s:if test="#awardRecords != null && #awardRecords.size() > 0">
 	<form action="awardRecord_byCompeFindAward">
         <div class="col-lg-4 col-lg-offset-1  col-md-4  col-md-offset-1 col-xs-4 col-lg-offset-1">                          
			<select name="id" class="form-control">
				<s:iterator value="awardRecords" var="compe">
					<option value="<s:property value="awardRecor_competition.compe_id" />"><s:date name="awardRecor_time" format="yyyy年"/>${awardRecor_competition.compe_compeName.compeName_name}</option>
				</s:iterator>
			</select>                     
         </div> 
         <div class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-xs-6 col-xs-offset-1">                                    
                <input type="submit" class="btn btn-default  active" value="查询">                   
          </div>
      </form>		
    </s:if>
    <s:else>
		<div class="row">
        <div class="col-lg-3 col-lg-offset-1 col-md-4 col-md-offset-1 col-xs-3  col-xs-offset-1">
            <p>暂无竞赛结果需要审核</p>
        </div>
    </div>
	</s:else>
	</div>
</div>                         
</body>
</html>





<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询要审核得竞赛</title>
</head>
<body>
<form action="awardRecord_byCompeFindAward">
	<select name="id">
		<s:iterator value="awardRecords" var="compe">
			<option value="<s:property value="awardRecor_competition.compe_id" />"><s:date name="awardRecor_time" format="yyyy年"/>${awardRecor_competition.compe_compeName.compeName_name}</option>
		</s:iterator>
	</select> 
	<input type="submit" value="查询">
</form>
</body>
</html> --%>