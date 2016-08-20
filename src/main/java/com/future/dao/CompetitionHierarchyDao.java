package com.future.dao;

import java.util.List;

import com.future.domain.CompetitionHierarchy;

public interface CompetitionHierarchyDao {

	/**
	 * zhaoshuo
	 * 得到所有竞赛等级
	 */
	public List<CompetitionHierarchy> getAll();
}
