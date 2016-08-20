package com.future.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
/**
 * 学生
 */
@Entity
@Table(name="cm_students")
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
	private Set<AwardRecord> stu_awardRecord = new HashSet<AwardRecord>();
	//学生对应的报名记录
	private Set<SignUp> stu_signUps = new HashSet<SignUp>();
	
	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getStu_id() {
		return stu_id;
	}
	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getStu_password() {
		return stu_password;
	}
	public void setStu_password(String stu_password) {
		this.stu_password = stu_password;
	}
	public String getStu_num() {
		return stu_num;
	}
	public void setStu_num(String stu_num) {
		this.stu_num = stu_num;
	}
	public String getStu_class() {
		return stu_class;
	}
	public void setStu_class(String stu_class) {
		this.stu_class = stu_class;
	}
	public String getStu_sex() {
		return stu_sex;
	}
	public void setStu_sex(String stu_sex) {
		this.stu_sex = stu_sex;
	}
	@ManyToOne(cascade=CascadeType.MERGE,optional=true,fetch=FetchType.EAGER)
	public Department getStu_department() {
		return stu_department;
	}
	public void setStu_department(Department stu_department) {
		this.stu_department = stu_department;
	}
	
	@OneToMany(cascade=CascadeType.MERGE, fetch=FetchType.LAZY,mappedBy="signUp_student")
	public Set<SignUp> getStu_signUps() {
		return stu_signUps;
	}
	public void setStu_signUps(Set<SignUp> stu_signUps) {
		this.stu_signUps = stu_signUps;
	}
	
	@OneToMany(cascade=CascadeType.MERGE, fetch=FetchType.LAZY,mappedBy="awardRecor_student")
	public Set<AwardRecord> getStu_awardRecord() {
		return stu_awardRecord;
	}
	public void setStu_awardRecord(Set<AwardRecord> stu_awardRecord) {
		this.stu_awardRecord = stu_awardRecord;
	}
	
	
}
