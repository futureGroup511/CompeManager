package com.future.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
/**
 * 获奖标准
 */
@Entity
@Table(name="cm_awardStandards")
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

	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getAward_id() {
		return award_id;
	}

	public void setAward_id(Integer award_id) {
		this.award_id = award_id;
	}

	public String getAward_type() {
		return award_type;
	}

	public void setAward_type(String award_type) {
		this.award_type = award_type;
	}

	public String getAward_teaMoney() {
		return award_teaMoney;
	}

	public void setAward_teaMoney(String award_teaMoney) {
		this.award_teaMoney = award_teaMoney;
	}

	public String getAward_stuMoney() {
		return award_stuMoney;
	}

	public void setAward_stuMoney(String award_stuMoney) {
		this.award_stuMoney = award_stuMoney;
	}
	@OneToOne()
	public AwardHierarchy getAward_awardHierarchy() {
		return award_awardHierarchy;
	}

	public void setAward_awardHierarchy(AwardHierarchy award_awardHierarchy) {
		this.award_awardHierarchy = award_awardHierarchy;
	}
	
	
	
}
