package com.future.domain;

import java.util.HashSet;
import java.util.Set;

/**
 *竞赛等级
 */  
public class CompetitionHierarchy {
	
	//竞赛等级id
	private Integer compeType_id;
	//竞赛等级名称
	private String compeType_name;
	//竞赛等级描述
	private String compeType_descr;
	
	//竞赛等级对应下的 竞赛名称
	private Set<CompetitionName> compeType_competitions = new HashSet<CompetitionName>();
	
}
