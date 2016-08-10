package com.future.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 奖励等级
 */
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
	
	
}
