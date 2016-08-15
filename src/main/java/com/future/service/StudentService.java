
package com.future.service;


import com.future.domain.Student;
import com.future.utils.Page_S;




public interface StudentService {

	public Student login(Student stu);
	
	public void addOrUpdateStudent(Student stu);
	
	public Student findStudentById(Integer id);
	
	public Student findStudentByNameAndNum(Student stu);

	public Page_S lookApplyByStatus(Student stu,Page_S ps);
	
	
}

