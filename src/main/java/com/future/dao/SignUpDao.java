package com.future.dao;

import com.future.domain.Competition;
import com.future.domain.SignUp;
import com.future.domain.Student;

public interface SignUpDao {

	
	public void addSignUp(SignUp sup);
	
	public SignUp jugeStudentuge(Student stu,Competition compe,Integer sup_type);
	
	public String jugeTeamexist(String team_name);
}
