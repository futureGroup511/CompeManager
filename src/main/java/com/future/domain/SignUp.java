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
 * 报名类
 */
@Entity
@Table(name="cm_signups")
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
	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getSignUp_id() {
		return signUp_id;
	}
	public void setSignUp_id(Integer signUp_id) {
		this.signUp_id = signUp_id;
	}
	public String getSignUp_teacher() {
		return signUp_teacher;
	}
	public void setSignUp_teacher(String signUp_teacher) {
		this.signUp_teacher = signUp_teacher;
	}
	public String getSignUp_team() {
		return signUp_team;
	}
	public void setSignUp_team(String signUp_team) {
		this.signUp_team = signUp_team;
	}
	public Integer getSingUp_manager() {
		return singUp_manager;
	}
	public void setSingUp_manager(Integer singUp_manager) {
		this.singUp_manager = singUp_manager;
	}
	public Integer getSignUp_status() {
		return signUp_status;
	}
	public void setSignUp_status(Integer signUp_status) {
		this.signUp_status = signUp_status;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getSignUP_time() {
		return signUP_time;
	}
	public void setSignUP_time(Date signUP_time) {
		this.signUP_time = signUP_time;
	}
	@ManyToOne(cascade=CascadeType.PERSIST,optional=false,fetch=FetchType.EAGER)
	public Student getSignUp_student() {
		return signUp_student;
	}
	public void setSignUp_student(Student signUp_student) {
		this.signUp_student = signUp_student;
	}
	@ManyToOne(cascade=CascadeType.PERSIST,optional=false,fetch=FetchType.EAGER)
	public Competition getSignUp_competition() {
		return signUp_competition;
	}
	public void setSignUp_competition(Competition signUp_competition) {
		this.signUp_competition = signUp_competition;
	}
	
	
	
}
