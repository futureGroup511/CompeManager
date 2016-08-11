package com.future.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 比赛记录
 */
@Entity
@Table(name="cm_awardRecords")
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
	
	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getAwardRecor_id() {
		return awardRecor_id;
	}
	public void setAwardRecor_id(Integer awardRecor_id) {
		this.awardRecor_id = awardRecor_id;
	}
	public String getAwardRecor_coachTeacher() {
		return awardRecor_coachTeacher;
	}
	public void setAwardRecor_coachTeacher(String awardRecor_coachTeacher) {
		this.awardRecor_coachTeacher = awardRecor_coachTeacher;
	}
	public String getAwardRecor_team() {
		return awardRecor_team;
	}
	public void setAwardRecor_team(String awardRecor_team) {
		this.awardRecor_team = awardRecor_team;
	}
	public Integer getAwardRecor_manager() {
		return awardRecor_manager;
	}
	public void setAwardRecor_manager(Integer awardRecor_manager) {
		this.awardRecor_manager = awardRecor_manager;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getAwardRecor_time() {
		return awardRecor_time;
	}
	public void setAwardRecor_time(Date awardRecor_time) {
		this.awardRecor_time = awardRecor_time;
	}
	public String getAwardRecor_stuMoney() {
		return awardRecor_stuMoney;
	}
	public void setAwardRecor_stuMoney(String awardRecor_stuMoney) {
		this.awardRecor_stuMoney = awardRecor_stuMoney;
	}
	public String getAwardRecor_teaMoney() {
		return awardRecor_teaMoney;
	}
	public void setAwardRecor_teaMoney(String awardRecor_teaMoney) {
		this.awardRecor_teaMoney = awardRecor_teaMoney;
	}
	public Integer getAwardRecor_score() {
		return awardRecor_score;
	}
	public void setAwardRecor_score(Integer awardRecor_score) {
		this.awardRecor_score = awardRecor_score;
	}
	public Integer getAwardRecor_status() {
		return awardRecor_status;
	}
	public void setAwardRecor_status(Integer awardRecor_status) {
		this.awardRecor_status = awardRecor_status;
	}
	public String getAwardRecor_picturePath() {
		return awardRecor_picturePath;
	}
	public void setAwardRecor_picturePath(String awardRecor_picturePath) {
		this.awardRecor_picturePath = awardRecor_picturePath;
	}
	@ManyToOne(cascade=CascadeType.PERSIST,optional=false,fetch=FetchType.EAGER)
	public Competition getAwardRecor_competition() {
		return awardRecor_competition;
	}
	public void setAwardRecor_competition(Competition awardRecor_competition) {
		this.awardRecor_competition = awardRecor_competition;
	}
	@ManyToOne(cascade=CascadeType.PERSIST,optional=false,fetch=FetchType.EAGER)
	public AwardHierarchy getAwardRecor_awadHie() {
		return awardRecor_awadHie;
	}
	public void setAwardRecor_awadHie(AwardHierarchy awardRecor_awadHie) {
		this.awardRecor_awadHie = awardRecor_awadHie;
	}
	@ManyToOne(cascade=CascadeType.PERSIST,optional=false,fetch=FetchType.EAGER)
	public Student getAwardRecor_student() {
		return awardRecor_student;
	}
	public void setAwardRecor_student(Student awardRecor_student) {
		this.awardRecor_student = awardRecor_student;
	}
	
	
	
	
	
}
