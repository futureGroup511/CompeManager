package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.future.dao.StudentDao;
import com.future.domain.Student;
import com.future.service.StudentService;
import com.future.utils.Page_S;

@Service
public class StudentServiceImp implements StudentService {

	@Autowired
	private StudentDao studao;

	@Override
	public Student login(Student stu) {
		Student student = studao.login(stu);
		return student;
	}

	@Override
	public void addOrUpdateStudent(Student stu) {
		studao.addOrUpdateStudent(stu);
	}

	@Override
	public Student findStudentById(Integer id) {

		return studao.findStudentById(id);
	}

	@Override
	public Student findStudentByNameAndNum(Student stu) {

		return studao.findStudentByNameAndNum(stu);
	}

	@Override
	public Page_S lookApplyByStatus(Student stu, Page_S ps) {

		return studao.lookApplyByStatus(stu, ps);
	}

	@Override
	public Page_S findAllStudenyByPage(Page_S ps) {
		return studao.findAllStudenyByPage(ps);
	}

	@Override
	public void updateStudent(Student stu) {
		studao.updateStudent(stu);
	}

	//一键重置学生密码
	@Override
	public void modifyStuPassword(Integer id) {
		studao.modifyStuPassword(id);
		
	}

	//学生修改密码
	@Override
	public void updatePassword(Student stu) {
		studao.updatePassword(stu);
	}

	//走Ajax校验原密码是否正确
	@Override
	public boolean isOrNopassword(Integer id,String isPassword) {
		return studao.isOrNopassword(id,isPassword);
	}
}
