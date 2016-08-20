package com.future.dao;

import java.util.List;

import com.future.domain.Competition;
import com.future.domain.SignUp;
import com.future.domain.Student;
import com.future.utils.PageBean;

public interface SignUpDao {
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
	 /**
	  * 修改指定人员为团队负责人
	  */
	public void makeToTeamLeader(String teamName, Integer signId);
	/**
	 * 修改指定人员为非团队负责人
	 */
	public void makeToNotTeamLeader(Integer signId);
	/**
	 * 得到团队成员的所有id
	 */
	public List<Integer> getSpecialTeamMembId(String teamName);
	/**
	 * 得到指定竞赛 未录入成绩的 通过审核的  团队报名
	 */
	public List<SignUp> getAvaliableGroupSignUp(Integer compeId, PageBean pageBean);
	/**
	 * 得到指定竞赛 未录入成绩的 通过审核的  个人报名
	 */
	public List<SignUp> getAvaliablePersonalSignUp(Integer compeId, PageBean pageBean);
	/**
	 * 改变指定报名表的 已录入成绩状态
	 * @param sup
	 */
	public void makeSignUpScored(Integer signUpId, Integer signUp_registerRecord);
	
	public void addSignUp(SignUp sup);
	
	public SignUp jugeStudentuge(Student stu,Competition compe,Integer sup_type);
	
	public String jugeTeamexist(String team_name);
}
