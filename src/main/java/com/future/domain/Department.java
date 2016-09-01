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
 *学院 
 */
@Entity
@Table(name="cm_departments")
public class Department {

	//学院id
	private Integer de_id;
	//学院名称
	private String de_name;
	//学院描述
	private String de_descr;
	
	//学院的所有学生
	 private Set<Student> de_students = new HashSet<Student>();
	//学院负责人
	//级联需要的再配
	private DepManager de_depM;
	//该学院申报的竞赛
	 private Set<Competition> de_competitions = new HashSet<Competition>();
	@Id
	@GeneratedValue
	@Column(unique=true)
	public Integer getDe_id() {
		return de_id;
	}
	public void setDe_id(Integer de_id) {
		this.de_id = de_id;
	}
	public String getDe_name() {
		return de_name;
	}
	public void setDe_name(String de_name) {
		this.de_name = de_name;
	}
	public String getDe_descr() {
		return de_descr;
	}
	public void setDe_descr(String de_descr) {
		this.de_descr = de_descr;
	}
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY,mappedBy="stu_department")
	public Set<Student> getDe_students() {
		return de_students;
	}
	public void setDe_students(Set<Student> de_students) {
		this.de_students = de_students;
	}
	@OneToOne()
	public DepManager getDe_depM() {
		return de_depM;
	}
	public void setDe_depM(DepManager de_depM) {
		this.de_depM = de_depM;
	}
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY,mappedBy="compe_department")
	public Set<Competition> getDe_competitions() {
		return de_competitions;
	}
	public void setDe_competitions(Set<Competition> de_competitions) {
		this.de_competitions = de_competitions;
	}
	
	
}
