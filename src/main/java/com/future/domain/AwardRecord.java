package com.future.domain;

import java.util.Date;

/**
 * 比赛记录
 */
public class AwardRecord {

	//比赛记录的 id
	private Integer awardRecor_id;
	//指导老师姓名
	private String awardRecor_coachTeacher;
	//如果是团队的话，该学生属于的队伍名称
	private String awardRecor_team;
	//如果是团队的话 就有
	private Integer awardRecor_manager;
	//获奖时间
	private Date awardRecor_time;
	//学生所获奖金
	private String awardRecor_stuMoney;
	//老师所获奖金
	private String awardRecor_teaMoney;
	//学生所获 学分
	private Integer awardRecor_score;
	//获奖记录的状态	
	private Integer awardRecor_status;
	//获奖整数
	private String awardRecor_picturePath;
	
	
	//参加的竞赛项目
	private Competition awardRecor_competition;
	//获奖等级
	private AwardHierarchy awardRecor_awadHie;
	//获奖 学生
	private Student awardRecor_student;
	
	
}
