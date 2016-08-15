package com.future.dao;

import com.future.domain.Competition;
import com.future.utils.Page_S;

public interface CompetitionDao {

	
	public Page_S findapplyCompetition(Page_S ps);

	public Integer getAllCount();
	
	public Competition findCompetitionById(Integer id);
	
	public void updateCompetition(Competition comp);
}
