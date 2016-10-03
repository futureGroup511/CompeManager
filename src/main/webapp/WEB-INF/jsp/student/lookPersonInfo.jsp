<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看个人信息</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<link rel="stylesheet" href="css/xin.css" />
</head>

<body>
<div class="container">
        <table class=" table table-striped table-bordered table-hover">
            <tbody>
                <tr>
                    <td align="center">学号</td>
                    <td align="center">${student.stu_num }</td>
                  
                </tr>
                <tr>
                    <td align="center">姓名</td>
                    <td align="center">${student.stu_name }</td>
                </tr>
                <tr>
                	<td align="center">性别</td>
                    <td align="center">${student.stu_sex}</td>
                </tr>
                <tr>
                	<td align="center">院系</td>
                    <td align="center">${student.stu_department.de_name }</td>
                </tr> 
                <tr>
                	<td align="center">专业</td>
                    <td align="center">${student.stu_major }</td>
                </tr>   
                <tr> 
               	    <td align="center">班级</td>
                    <td align="center">${student.stu_class }</td>
                </tr>    
                <tr>
                	<td align="center">身份证号</td>
                    <td align="center">${student.stu_idCard }</td>
                </tr>  
                <tr>
                	<td align="center">年级</td>
               	    <td align="center">${student.stu_grade }</td>
                </tr>    
                <tr>
                	<td align="center">联系方式</td>
                    <td align="center">${student.stu_phone }</td>
                </tr>  
            </tbody>
        </table>
</div>
<div class="footer">
	<a href="student_updatePasswordUI?stu_id=${student.stu_id }" class="btn btn-default  active">修改密码</a>
</div>
</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看个人信息</title>
</head>
<body>
学号：${student.stu_name }  <br>
姓名：${student.stu_num }<br>
性别：${student.stu_sex}<br>
院系：${student.stu_department.de_name }<br>
专业：${student.stu_major }<br>
班级：${student.stu_class }<br>
身份证号：${student.stu_idCard }<br>
年级：${student.stu_grade }<br>
联系方式：${student.stu_phone }<br><br>
<a href="student_updatePasswordUI?stu_id=${student.stu_id }">修改密码</a>
</body>
</html> --%>