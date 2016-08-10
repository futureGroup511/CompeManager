package com.future.domain;

import java.util.HashSet;
import java.util.Set;
/**
 * 竞赛名称
 */
public class CompetitionName {
	
	//竞赛名称 id
	private Integer compeName_id;
	//竞赛名称 名称
	private String compeName_name;
	//竞赛名称 描述
	private String compeName_descr;
	
	
	//竞赛名称 对应的竞赛项目
	private Set<Competition> compeName_competitions = new HashSet<Competition>();
	//竞赛名称 对应的竞赛级别
	private CompetitionHierarchy compeName_compeHierarchy;
}
