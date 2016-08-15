
package com.future.dao;



import org.springframework.stereotype.Repository;

import com.future.domain.Student;
@Repository
public interface StudentDao {

	
	public Student login(Student student);
	
	public void addOrUpdateStudent(Student stu);
	
	public Student findStudentById(Integer id);
	
	public Student findStudentByNameAndNum(Student student);
}

