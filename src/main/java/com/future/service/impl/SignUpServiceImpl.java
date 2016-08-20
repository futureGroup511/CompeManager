package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.SignUpDao;
import com.future.domain.Competition;
import com.future.domain.SignUp;
import com.future.domain.Student;
import com.future.service.SignUpService;
import com.future.utils.PageBean;

@Service
@Transactional
public class SignUpServiceImpl implements SignUpService{

	@Autowired
	private SignUpDao signUpDao;
	
	@Override
	public List<SignUp> getAllSignUp(PageBean pageBean) {
		return signUpDao.getAllSignUp(pageBean);
	}

	@Override
	public SignUp getById(Integer id) {
		return signUpDao.getById(id);
	}

	@Override
	public List<String> getAllGroupName(PageBean pageBean) {
		return null;
	}

	@Override
	public List<SignUp> getSpecialGroupMember(String groupName) {
		return null;
	}

	@Override
	public boolean groupNameExist(String groupName) {
		return false;
	}

	@Override
	public void refreshGroupSignUp(SignUp signUp) {
		
	}

	@Override
	public List<SignUp> getPersonalSignUp(PageBean pageBean) {
		return null;
	}

	@Override
	public void refreshSignUp(SignUp signUp) {
		
	}

	@Override
	public Integer getCount() {
		return signUpDao.getCount();
	}

	@Override
	public void changeSignStatus(Integer signId, Integer signStatus) {
		signUpDao.changeSignStatus(signId, signStatus);
	}
	

	@Override
	public void addSignUp(SignUp sup) {
		signUpDao.addSignUp(sup);
	}

	@Override
	public SignUp jugeStudentuge(Student stu,Competition compe,Integer sup_type) {
		return signUpDao.jugeStudentuge(stu,compe,sup_type);
	}

	@Override
	public String jugeTeamexist(String team_name) {
		
		return signUpDao.jugeTeamexist(team_name);
	}

	@Override
	public void makeToTeamLeader(String teamName, Integer signId) {
		signUpDao.makeToTeamLeader(teamName, signId);
	}

	
	@Override
	public List<SignUp> getAvaliableGroupSignUp(Integer compeId, PageBean pageBean) {
		return signUpDao.getAvaliableGroupSignUp(compeId, pageBean);
	}

	@Override
	public List<SignUp> getAvaliablePersonalSignUp(Integer compeId, PageBean pageBean) {
		return signUpDao.getAvaliablePersonalSignUp(compeId, pageBean);
	}

	@Override
	public void makeSignUpScored(Integer signUpId, Integer signUp_registerRecord) {
		signUpDao.makeSignUpScored(signUpId, signUp_registerRecord);
	}
}
