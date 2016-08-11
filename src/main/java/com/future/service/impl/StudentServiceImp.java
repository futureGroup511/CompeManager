package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.future.dao.StudentDao;
import com.future.domain.Student;
import com.future.service.StudentService;

public class StudentServiceImp implements StudentService {

	@Autowired
	private StudentDao studao;
	@Override
	public Student login(Student stu) {
		Student student=studao.login(stu);
		return student;
	}

}
