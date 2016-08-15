package com.future.domain;

import java.util.HashSet;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
/**
 * 竞赛名称
 */
@Entity
@Table(name="cm_competitionnames")
public class CompetitionName {
	
	//竞赛名称 id
	private Integer compeName_id;
	//竞赛名称 名称
	private String compeName_name;
	//竞赛名称 描述
	private String compeName_descr;
	//竞赛项目 的状态  1提交申请 正在审核 ,2 审核通过,  0 审核失败
	private String compeName_status;
	
	//竞赛名称 对应的竞赛项目
	private Set<Competition> compeName_competitions = new HashSet<Competition>();
	//竞赛名称 对应的竞赛级别
	private CompetitionHierarchy compeName_compeHierarchy;
	
	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getCompeName_id() {
		return compeName_id;
	}
	public void setCompeName_id(Integer compeName_id) {
		this.compeName_id = compeName_id;
	}
	public String getCompeName_name() {
		return compeName_name;
	}
	public void setCompeName_name(String compeName_name) {
		this.compeName_name = compeName_name;
	}
	public String getCompeName_descr() {
		return compeName_descr;
	}
	public void setCompeName_descr(String compeName_descr) {
		this.compeName_descr = compeName_descr;
	}
	
	public String getCompeName_status() {
		return compeName_status;
	}
	public void setCompeName_status(String compeName_status) {
		this.compeName_status = compeName_status;
	}
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY,mappedBy="compe_compeName")
	public Set<Competition> getCompeName_competitions() {
		return compeName_competitions;
	}
	public void setCompeName_competitions(Set<Competition> compeName_competitions) {
		this.compeName_competitions = compeName_competitions;
	}
	@ManyToOne(cascade={CascadeType.PERSIST},optional=true,fetch=FetchType.EAGER)
	public CompetitionHierarchy getCompeName_compeHierarchy() {
		return compeName_compeHierarchy;
	}
	public void setCompeName_compeHierarchy(CompetitionHierarchy compeName_compeHierarchy) {
		this.compeName_compeHierarchy = compeName_compeHierarchy;
	}
	
	
}
