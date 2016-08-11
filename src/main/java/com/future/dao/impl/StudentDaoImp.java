package com.future.dao.impl;

import com.future.base.BaseDao;
import com.future.dao.StudentDao;
import com.future.domain.Student;

public class StudentDaoImp extends BaseDao implements StudentDao{

	@Override
	public Student login(Student student) {
		String hql="From Student s where s.stu_num=? and s.stu_password=?";
		Student stu=(Student) getsession().createQuery(hql).setString(0, student.getStu_num()).setString(1, student.getStu_password()).uniqueResult();
		return stu;
	}

}
