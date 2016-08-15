
package com.future.service;


import com.future.domain.Student;




public interface StudentService {

	public Student login(Student stu);
	
	public void addOrUpdateStudent(Student stu);
	
	public Student findStudentById(Integer id);
	
	public Student findStudentByNameAndNum(Student stu);

   
}

