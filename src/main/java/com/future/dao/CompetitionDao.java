package com.future.dao;

import java.util.List;

import com.future.domain.Competition;
import com.future.utils.PageBean;

public interface CompetitionDao {
	
	/**
	 * 保存竞赛信息
	 */
	public void save(Competition competition);
	/**
	 * 查询所有竞赛
	 */
	public List<Competition> getCompetitions();
	/**
	 * 分页查询竞赛信息
	 */
	public List<Competition> getCompetitionByPage(PageBean pageBean);
	/**
	 * 有id查询指定竞赛
	 */
	public Competition getCompetitionById(Integer id);
	/**
	 * 查询竞赛的数量
	 */
	public Integer getCompetitionCount();
}
