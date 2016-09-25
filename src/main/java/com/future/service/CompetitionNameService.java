
package com.future.service;

import java.util.List;

import com.future.domain.CompetitionName;

import com.future.utils.PageBean;

public interface CompetitionNameService {

	//查询待审核竞赛名称立标
	List<CompetitionName> findAllCheckNoName();

	//1、调用service查询审核成功项目名称
	List<CompetitionName> checkSuccessName();

	//查看未通过审核竞赛名称
	List<CompetitionName> noPassCheck();

	//通过
	void pass(Integer id);

	//未通过
	void noPass(Integer id, String reason);

	//通过id获得具体数据
	CompetitionName findById(Integer id);

	//修改
	void alter(CompetitionName model);

	//分页查看审核成功竞赛名称
	PageBean getPageBeanCheckSuccessName(int pageNum, int pageSize);

	//分页查看待审核竞赛名称
	PageBean getPageBeanCheckNoName(int pageNum, int pageSize);

	//分页查看未通过审核竞赛名称
	PageBean getPageBeanNoPassCheck(int pageNum, int pageSize);

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
	/**
	 * 赵硕
	 * 分页查询竞赛名称
	 * @param pageBean
	 * @return
	 */
	List<CompetitionName> getCompeNamesByPageBean(PageBean pageBean);
	
	public boolean queryCompeName(String compeNameVal);

}
