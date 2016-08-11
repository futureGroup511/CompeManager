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
import javax.persistence.Table;
/**
 *竞赛等级
 */  
@Entity
@Table(name="cm_competitionhierarchies")
public class CompetitionHierarchy {
	
	//竞赛等级id
	private Integer compeHie_id;
	//竞赛等级名称
	private String compeHie_name;
	//竞赛等级描述
	private String compeHie_descr;
	
	//竞赛等级对应下的 竞赛名称
	private Set<CompetitionName> compeHie_competitionName = new HashSet<CompetitionName>();
	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getCompeHie_id() {
		return compeHie_id;
	}

	public void setCompeHie_id(Integer compeHie_id) {
		this.compeHie_id = compeHie_id;
	}

	public String getCompeHie_name() {
		return compeHie_name;
	}

	public void setCompeHie_name(String compeHie_name) {
		this.compeHie_name = compeHie_name;
	}

	public String getCompeHie_descr() {
		return compeHie_descr;
	}

	public void setCompeHie_descr(String compeHie_descr) {
		this.compeHie_descr = compeHie_descr;
	}

	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY,mappedBy="compeName_compeHierarchy")
	public Set<CompetitionName> getCompeHie_competitionName() {
		return compeHie_competitionName;
	}

	public void setCompeHie_competitionName(Set<CompetitionName> compeHie_competitionName) {
		this.compeHie_competitionName = compeHie_competitionName;
	}

	
	
	
	
	
}
