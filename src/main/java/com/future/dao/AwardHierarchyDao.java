package com.future.dao;

import java.util.List;

import com.future.domain.AwardHierarchy;
import com.future.utils.Page_S;

public interface AwardHierarchyDao {
	// 查询所有奖项
	List<AwardHierarchy> findAllAwardHierarchy();
	List<AwardHierarchy> findAllAwardHierarchyTG();

	/**
	 * @author 牛洧鹏
	 * @param ps
	 * @return 分页查询竞赛等级AwardHierarchy
	 */
	public Page_S findAll(Page_S ps);

	/**
	 * 
	 * 通过ID进行查询
	 * 
	 * @param id
	 * @return
	 */
	public AwardHierarchy fomdByID(Integer id);

	/**
	 * 添加或者删除
	 * 
	 * @param competitionHierarchy
	 */
	public void addOrupdate(AwardHierarchy awardHierarchy);

	/**
	 * 查询得到所有获奖等级
	 */
	public List<AwardHierarchy> getGroupOrPersonalAwardHie(boolean isGroup);

	/**
	 * 查询指定的获奖等级
	 */
	public AwardHierarchy getSpecialAwardHie(Integer awardHieId);
}
