package com.future.dao;

import java.util.List;

import com.future.domain.CompetitionName;

public interface CompetitionNameDao {

	/**
	 * zhaoshuo
	 * 保存竞赛名称
	 */
	public void save(CompetitionName competitionName);
	
	/**
	 * zhaoshuo
	 * 得到所有的竞赛名称
	 */
	public List<CompetitionName> getAllCompeNames();
}
