
package com.future.dao;



import org.springframework.stereotype.Repository;

import com.future.domain.Student;
import com.future.utils.Page_S;
@Repository
public interface StudentDao {

	
	public Student login(Student student);
	
	public void addOrUpdateStudent(Student stu);
	
	public Student findStudentById(Integer id);
	
	public Student findStudentByNameAndNum(Student student);

	public Page_S lookApplyByStatus(Student stu,Page_S ps);
}

