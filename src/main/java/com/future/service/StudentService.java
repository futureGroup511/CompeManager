package com.future.service;


import com.future.domain.Student;
import com.future.utils.Page_S;




public interface StudentService {

	public Student login(Student stu);
	
	public void addOrUpdateStudent(Student stu);
	
	public Student findStudentById(Integer id);
	
	public Student findStudentByNameAndNum(Student stu);

	public Page_S lookApplyByStatus(Student stu,Page_S ps);
	
	public Page_S findAllStudenyByPage(Page_S ps) ;
	
	public void updateStudent(Student stu);

	//一键重置学生密码
	public void modifyStuPassword(Integer id);

	//学生修改密码
	public void updatePassword(Student stu);
}

