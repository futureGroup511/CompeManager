package com.future.domain;

import java.util.HashSet;
import java.util.Set;

/**
 *学院 
 */
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
	private DepManager de_depM;
	//该学院申报的竞赛
	private Competition de_competition;
	
	
	
	
}
