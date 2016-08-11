package com.future.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 奖励等级
 */
@Entity
@Table(name="cm_awardHierarchies")
public class AwardHierarchy {

	//奖励等级的 id
	private Integer awardHie_id;
	//奖励等级 的名称
	private String awardHie_name;
	//奖励等级的描述
	private String awardHie_descr;
	
	
	//奖励标准
	private AwardStandard awardHie_standard;
	//奖励记录
	private Set<AwardRecord> awardHie_awardRecords = new HashSet<AwardRecord>();
	
	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getAwardHie_id() {
		return awardHie_id;
	}
	public void setAwardHie_id(Integer awardHie_id) {
		this.awardHie_id = awardHie_id;
	}
	public String getAwardHie_name() {
		return awardHie_name;
	}
	public void setAwardHie_name(String awardHie_name) {
		this.awardHie_name = awardHie_name;
	}
	public String getAwardHie_descr() {
		return awardHie_descr;
	}
	public void setAwardHie_descr(String awardHie_descr) {
		this.awardHie_descr = awardHie_descr;
	}
	@OneToOne()
	public AwardStandard getAwardHie_standard() {
		return awardHie_standard;
	}
	public void setAwardHie_standard(AwardStandard awardHie_standard) {
		this.awardHie_standard = awardHie_standard;
	}
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY,mappedBy="awardRecor_awadHie")
	public Set<AwardRecord> getAwardHie_awardRecords() {
		return awardHie_awardRecords;
	}
	public void setAwardHie_awardRecords(Set<AwardRecord> awardHie_awardRecords) {
		this.awardHie_awardRecords = awardHie_awardRecords;
	}
	
	
	
	
}
