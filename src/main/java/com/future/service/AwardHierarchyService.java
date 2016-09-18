package com.future.service;

import java.util.List;

import com.future.domain.AwardHierarchy;
import com.future.utils.Page_S;

public interface AwardHierarchyService {
	
	//查询所有奖项    刘阳
	List<AwardHierarchy> findAllAwardHierarchy();
	/**
	 * 查询得到所有获奖等级
	 */
	public List<AwardHierarchy> getGroupOrPersonalAwardHie(boolean isGroup);
	/**
	 * 查询指定的获奖等级
	 */
	public AwardHierarchy getSpecialAwardHie(Integer awardHieId);
		
	public Page_S findAll(Page_S ps) ;

	public AwardHierarchy fomdByID(Integer id) ;

	public void addOrupdate(AwardHierarchy awardHierarchy) ;
	
	//查询所有奖项
	List<AwardHierarchy> findAllAwardHierarchyTG();
}
