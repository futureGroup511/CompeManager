package com.future.domain;

/**
 * 学院负责人
 */
public class DepManager {

	//学院负责人id
	private Integer depM_id;
	//学院负责人姓名
	private String depM_name;
	//学院负责人工号	充当登陆账号
	private String depM_num;
	//学院负责人性别
	private String depM_sex;
	//学院负责人电话号码
	private String depM_phoneNum;
	//学院负责人 密码
	private String depM_password;
	
	
	//学院负责人 负责的院系
	private Department depM_department;
	
}
