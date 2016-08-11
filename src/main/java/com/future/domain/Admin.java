package com.future.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 教务处管理员
 */
@Entity
@Table(name="cm_admins")
public class Admin {
	
	//教务处管理员 id
	private Integer ad_id;
	//教务处管理员 姓名
	private String ad_name;
	//教务处管理员 账号
	private String ad_num;
	//教务处管理员 密码
	private String ad_password;
	//教务处管理员 性别
	private String ad_sex;
	
	@Id
	@GeneratedValue
	@Column(name="ad_id", unique=true)
	public Integer getAd_id() {
		return ad_id;
	}
	public void setAd_id(Integer ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getAd_num() {
		return ad_num;
	}
	public void setAd_num(String ad_num) {
		this.ad_num = ad_num;
	}
	public String getAd_password() {
		return ad_password;
	}
	public void setAd_password(String ad_password) {
		this.ad_password = ad_password;
	}
	public String getAd_sex() {
		return ad_sex;
	}
	public void setAd_sex(String ad_sex) {
		this.ad_sex = ad_sex;
	}
	
}
