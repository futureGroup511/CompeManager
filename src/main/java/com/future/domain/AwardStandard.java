package com.future.domain;
/**
 * 获奖标准
 */
public class AwardStandard {
	//奖励id
	private Integer award_id;
	//竞赛类型  团队  个人  
	private String award_type;
	//学生获奖金额
	private String award_teaMoney;
	//指导老师获奖金额
	private String award_stuMoney;
	
	//获奖奖励等级
	private AwardHierarchy award_awardHierarchy;
	
}
