package com.future.dao.impl;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.StudentDao;
import com.future.domain.Student;

@Repository
public class StudentDaoImpl extends BaseDao implements StudentDao {

	@Override
	public Student login(Student student) {
		return null;
	}

}
