package com.future.dao;

import com.future.domain.AwardHierarchy;
import com.future.utils.Page_S;

public interface AwardHierarchyDao {
	/**
	 * @author 牛洧鹏
	 * @param ps
	 * @return
	 * 分页查询竞赛等级
	 */
	public Page_S findAll(Page_S ps);

	/**
	 * 通过ID进行查询
	 * @param id
	 * @return
	 */
	public AwardHierarchy fomdByID(Integer id);
	
	/**
	 * 添加或者删除
	 * @param competitionHierarchy
	 */
	public void addOrupdate(AwardHierarchy awardHierarchy);
}
