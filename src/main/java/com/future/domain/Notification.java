package com.future.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
/**
 * 通知
 */
@Entity
@Table(name="cm_notifications")
public class Notification {
	//通知时间
	private Integer noti_id;
	//通知标题
	private String noti_title;
	//通知内容
	private String noti_content;
	//通知发布时间
	private Date noti_time;
	
	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getNoti_id() {
		return noti_id;
	}
	public void setNoti_id(Integer noti_id) {
		this.noti_id = noti_id;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getNoti_time() {
		return noti_time;
	}
	public void setNoti_time(Date noti_time) {
		this.noti_time = noti_time;
	}
	
	
	
}
