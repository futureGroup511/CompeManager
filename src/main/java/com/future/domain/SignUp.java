package com.future.domain;

import java.util.Date;

/**
 * 报名类
 */
public class SignUp {

	//报名类的 id
	private Integer signUp_id;
	//指导老师
	private String signUp_teacher;
	//如果是团队的话就拥有 团队名称及负责人
	private String signUp_team;
	// 如果是团队的话就	标注是团队负责人  0 不是 1 是
	private Integer singUp_manager;
	//报名的状态，表明是否通过审核    1: 报名 2: 审核通过 3：未通过 
	private Integer signUp_status;
	//报名时间
	private Date signUP_time;
	//报名表的学生
	private Student signUp_student;
	//该学生 报名的竞赛
	private Competition signUp_competition;
	
}
