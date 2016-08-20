package com.future.service;

import java.util.List;

import com.future.domain.CompetitionHierarchy;

public interface CompetitionHierarchyService {

	/**
	 * zhaoshuo
	 * 得到所有的竞赛等级
	 */
	public List<CompetitionHierarchy> getAll();
}
