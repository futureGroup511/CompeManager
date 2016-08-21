package com.future.service;


import java.util.List;

import com.future.domain.CompetitionName;

public interface CompetitionNameService {

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
	/**
	 * zhaoshuo
	 * 得到所有可用的 竞赛名称     申请竞赛的时候可以使用的所有的数据
	 * @return
	 */
	public List<CompetitionName> getAvailableCompeNames();
}
