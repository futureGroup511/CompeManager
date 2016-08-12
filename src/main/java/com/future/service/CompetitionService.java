package com.future.service;

import com.future.utils.Page_S;

public interface CompetitionService {

	/**
	 * 分页查询出可报名的比赛
	 * @param ps
	 * @return
	 */
	public Page_S findapplyCompetition(Page_S ps);
	
}
