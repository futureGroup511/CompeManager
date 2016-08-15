package com.future.service;

import java.util.List;

import com.future.domain.Competition;
import com.future.domain.SignUp;
import com.future.domain.Student;
import com.future.utils.PageBean;

public interface SignUpService {

	/**
	 * 得到所有的报名信息
	 */
	public List<SignUp> getAllSignUp(PageBean pageBean);
	/**
	 * 由id得到指定的报名信息
	 */
	public SignUp getById(Integer id);
	/**
	 * 分页查询 得到所有的团队报名
	 */
	public List<String> getAllGroupName(PageBean pageBean);
	/**
	 * 得到指定团队的所有成员
	 */
	public List<SignUp> getSpecialGroupMember(String groupName);
	/**
	 * 查询是否已经存在指定团队名称
	 */
	public boolean groupNameExist(String groupName);
	/**
	 * 更新团队报名信息
	 */
	public void refreshGroupSignUp(SignUp signUp);
	
	/**
	 * 分页查询  	个人报名信息
	 */
	public List<SignUp> getPersonalSignUp(PageBean pageBean);
	
	/**
	 * 更新个人报名信息
	 */
	public void refreshSignUp(SignUp signUp);
	/**
	 * 查询到所有的数量 
	 */
	public Integer getCount();
	/**
	 * 改变审核状态
	 */
	public void changeSignStatus(Integer signId, Integer signStatus);
	
	public void addSignUp(SignUp sup);
	
	public SignUp  jugeStudentuge(Student stu,Competition compe,Integer sup_type);
	
	 public String jugeTeamexist(String team_name);
}
