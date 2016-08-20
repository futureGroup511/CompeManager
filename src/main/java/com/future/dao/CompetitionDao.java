package com.future.dao;

import com.future.domain.Competition;
import com.future.utils.Page_S;

public interface CompetitionDao {

	
	public Page_S findapplyCompetition(Page_S ps);

	//根据id获得对象
	public Competition findById(Integer compe_id);

	//保存修改
	public void save(Competition competition);
}
