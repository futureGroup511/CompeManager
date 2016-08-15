package com.future.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
/**
 * 竞赛
 */
@Entity
@Table(name="cm_competitions")
public class Competition {
	
	//竞赛项目id
	private Integer compe_id;
	//竞赛项目负责人
	private String compe_manager;
	//竞赛项目申报时间
	private Date compe_requestDate;
	//竞赛项目 开始时间
	private Date compe_startTime;
	//竞赛项目 结束时间
	private Date compe_endTime;
	//竞赛 所需经费
	private String compe_money;
	//竞赛类型  1 团体，2 个人 3 其他
	private Integer compe_type;
	//项目 状态  1 申请 2 审核通过 3进行中 4 正常结束   0 审核未通过
	private Integer compe_status;
	//竞赛方案     文件的url
	private String compe_program;
	//竞赛摘要   (<200)
	private String compe_digest;
	//竞赛项目名称
	private CompetitionName compe_compeName;
	//所申请竞赛的院系
	private Department compe_department;
	
	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getCompe_id() {
		return compe_id;
	}
	public void setCompe_id(Integer compe_id) {
		this.compe_id = compe_id;
	}
	public String getCompe_manager() {
		return compe_manager;
	}
	public void setCompe_manager(String compe_manager) {
		this.compe_manager = compe_manager;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCompe_requestDate() {
		return compe_requestDate;
	}
	public void setCompe_requestDate(Date compe_requestDate) {
		this.compe_requestDate = compe_requestDate;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCompe_startTime() {
		return compe_startTime;
	}
	public void setCompe_startTime(Date compe_startTime) {
		this.compe_startTime = compe_startTime;
	}
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCompe_endTime() {
		return compe_endTime;
	}
	public void setCompe_endTime(Date compe_endTime) {
		this.compe_endTime = compe_endTime;
	}
	public String getCompe_money() {
		return compe_money;
	}
	public void setCompe_money(String compe_money) {
		this.compe_money = compe_money;
	}
	public Integer getCompe_status() {
		return compe_status;
	}
	public void setCompe_status(Integer compe_status) {
		this.compe_status = compe_status;
	}
	public String getCompe_program() {
		return compe_program;
	}
	public void setCompe_program(String compe_program) {
		this.compe_program = compe_program;
	}
	public String getCompe_digest() {
		return compe_digest;
	}
	public void setCompe_digest(String compe_digest) {
		this.compe_digest = compe_digest;
	}
	@ManyToOne(cascade=CascadeType.PERSIST,optional=true,fetch=FetchType.EAGER)
	public CompetitionName getCompe_compeName() {
		return compe_compeName;
	}
	public void setCompe_compeName(CompetitionName compe_compeName) {
		this.compe_compeName = compe_compeName;
	}
	@ManyToOne(cascade=CascadeType.PERSIST,optional=true,fetch=FetchType.EAGER)
	public Department getCompe_department() {
		return compe_department;
	}
	public void setCompe_department(Department compe_department) {
		this.compe_department = compe_department;
	}
	public Integer getCompe_type() {
		return compe_type;
	}
	public void setCompe_type(Integer compe_type) {
		this.compe_type = compe_type;
	}
	//竞赛对应的 获奖记录
	//private Set<AwardRecord> compe_awardRecord = new HashSet<AwardRecord>();
	
	
	
	
	
	
}
