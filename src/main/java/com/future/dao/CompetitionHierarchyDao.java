package com.future.dao;

import java.util.List;

import com.future.domain.CompetitionHierarchy;
import com.future.utils.Page_S;

public interface CompetitionHierarchyDao {

	/**
	 * zhaoshuo
	 * 得到所有竞赛等级
	 */
	public List<CompetitionHierarchy> getAll();
	
	/**
	 * @author 牛洧鹏
	 * @param ps
	 * @return
	 * 分页查询竞赛等级
	 */
	public Page_S findAllCompeHierarchy(Page_S ps);

	/**
	 * 通过ID进行查询
	 * @param id
	 * @return
	 */
	public CompetitionHierarchy fomdByID(Integer id);
	
	/**
	 * 添加或者删除
	 * @param competitionHierarchy
	 */
	public void addOrupdate(CompetitionHierarchy competitionHierarchy);
}
