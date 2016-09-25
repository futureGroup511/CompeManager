<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<a href="student_updatePassword?id=${student.stu_id }">修改密码</a>
</body>
</html>