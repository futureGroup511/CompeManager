package com.future.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
/**
 * 学院负责人
 */
@Entity
@Table(name="cm_demanagers")
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

	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getDepM_id() {
		return depM_id;
	}


	public void setDepM_id(Integer depM_id) {
		this.depM_id = depM_id;
	}


	public String getDepM_name() {
		return depM_name;
	}


	public void setDepM_name(String depM_name) {
		this.depM_name = depM_name;
	}


	public String getDepM_num() {
		return depM_num;
	}


	public void setDepM_num(String depM_num) {
		this.depM_num = depM_num;
	}


	public String getDepM_sex() {
		return depM_sex;
	}


	public void setDepM_sex(String depM_sex) {
		this.depM_sex = depM_sex;
	}


	public String getDepM_phoneNum() {
		return depM_phoneNum;
	}


	public void setDepM_phoneNum(String depM_phoneNum) {
		this.depM_phoneNum = depM_phoneNum;
	}


	public String getDepM_password() {
		return depM_password;
	}


	public void setDepM_password(String depM_password) {
		this.depM_password = depM_password;
	}

	@OneToOne()
	public Department getDepM_department() {
		return depM_department;
	}


	public void setDepM_department(Department depM_department) {
		this.depM_department = depM_department;
	}
	
}
