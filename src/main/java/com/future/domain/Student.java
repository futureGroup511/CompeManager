package com.future.domain;

/**
 * 学生
 */
public class Student {

	//学生id
	private Integer stu_id;
	//学生姓名
	private String stu_name;
	//学生密码
	private String stu_password;
	//学生学号   充当学号
	private String stu_num;
	//学生所属班级
	private String stu_class;
	//学生性别
	private String stu_sex;
	
	//所属院系
	private Department stu_department;
	//学生获奖记录
	private AwardRecord stu_awardRecord;
	//学生对应的报名记录
	private SignUp stu_signUp;
	
	
	
	
}
