package com.future.service;

import com.future.domain.Competition;
import com.future.utils.Page_S;

public interface CompetitionService {

	/**
	 * 分页查询出可报名的比赛
	 * @param ps
	 * @return
	 */
	public Page_S findapplyCompetition(Page_S ps);
	
	
	public Competition findCompetitionById(Integer id);
	
	public void updateCompetition(Competition comp);


}
