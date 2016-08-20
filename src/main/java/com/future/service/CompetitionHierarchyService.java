package com.future.service;

import java.util.List;

import com.future.domain.CompetitionHierarchy;
import com.future.utils.Page_S;

public interface CompetitionHierarchyService {

	/**
	 * zhaoshuo
	 * 得到所有的竞赛等级
	 */
	public List<CompetitionHierarchy> getAll();
	
	//分页
	public Page_S findAllCompeHierarchy(Page_S ps);
	
	/**
	 * 根据ID查询竞赛等级
	 * @param id
	 * @return
	 * @author 牛洧鹏
	 */
	public CompetitionHierarchy fomdByID(Integer id);
	
	/**
	 * 添加或删除竞赛等级
	 * @param competitionHierarchy
	 */
	public void addOrupdate(CompetitionHierarchy competitionHierarchy);
}
