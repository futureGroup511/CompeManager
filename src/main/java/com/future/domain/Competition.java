package com.future.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 竞赛
 */
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
	//竞赛项目 
	private String compe_money;
	//项目
	private Integer compe_status;
	//竞赛方案     文件的url
	private String compe_program;
	//竞赛摘要   (<200)
	private String compe_digest;
	
	//竞赛项目名称
	private CompetitionName compe_compeName;
	//所申请竞赛的院系
	private Department compe_department;
	
	//竞赛对应的 获奖记录
	//private Set<AwardRecord> compe_awardRecord = new HashSet<AwardRecord>();
	
	
	
	
	
	
}
