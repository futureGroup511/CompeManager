package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.SignUpDao;
import com.future.domain.SignUp;
import com.future.service.SignUpService;
import com.future.utils.PageBean;

@Service
@Transactional
public class SignUpServiceImpl implements SignUpService{

	@Resource
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer getCount() {
		return signUpDao.getCount();
	}

	@Override
	public void changeSignStatus(Integer signId, Integer signStatus) {
		signUpDao.changeSignStatus(signId, signStatus);
	}
}
