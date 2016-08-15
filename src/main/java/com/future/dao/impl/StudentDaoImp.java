package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.StudentDao;
import com.future.domain.Student;
@Repository
public class StudentDaoImp extends BaseDao implements StudentDao{

	@Override
	public Student login(Student student) {
		String hql="From Student s where s.stu_num=? and s.stu_password=?";
		Student stu=(Student) getsession().createQuery(hql).setString(0, student.getStu_num()).setString(1, student.getStu_password()).uniqueResult();
		return stu;
	}

	@Override
	public void addOrUpdateStudent(Student stu) {
			getsession().saveOrUpdate(stu);
	}

	@Override
	public Student findStudentById(Integer id) {
		String hql="from Student s where s.stu_id=?";
		Student student;
		//Student student=(Student) getsession().createQuery(hql).setInteger(0, id).uniqueResult();
		List<Student> students=getsession().createQuery(hql).setInteger(0, id).list();
		if(students.size()==0){
			return null;
		}
		student=students.get(0);
		return student;
	}

	@Override
	public Student findStudentByNameAndNum(Student student) {

		String hql="From Student s where s.stu_name=? and s.stu_num=?";
		Student stu=(Student) getsession().createQuery(hql).setString(0, student.getStu_name()).setString(1, student.getStu_num()).uniqueResult();
		return stu;
	}

}
