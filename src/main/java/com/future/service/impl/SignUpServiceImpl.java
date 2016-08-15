package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.SignUpDao;
import com.future.domain.Competition;
import com.future.domain.SignUp;
import com.future.domain.Student;
import com.future.service.SignUpService;

@Service
@Transactional
public class SignUpServiceImpl  implements SignUpService{

	@Autowired
	private SignUpDao signUpDao;

	@Override
	public void addSignUp(SignUp sup) {
		signUpDao.addSignUp(sup);
	}

	@Override
	public SignUp jugeStudentuge(Student stu,Competition compe,Integer sup_type) {
		return signUpDao. jugeStudentuge(stu,compe,sup_type);
	}

	@Override
	public String jugeTeamexist(String team_name) {
		
		return signUpDao.jugeTeamexist(team_name);
	}
}
