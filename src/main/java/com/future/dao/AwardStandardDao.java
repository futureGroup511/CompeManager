package com.future.dao;

import java.util.List;
import com.future.domain.AwardStandard;
import com.future.utils.Page_S;

public interface AwardStandardDao {

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
	public AwardStandard fomdByID(Integer id);
	
	/**
	 * 添加或者删除
	 * @param competitionHierarchy
	 */
	public void addOrupdate(AwardStandard as);
	
	public List<AwardStandard> getAll();

	//根据获奖等级id，找到奖励标准
	public AwardStandard findById(Integer id);
}
