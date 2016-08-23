package com.future.service;

import java.util.List;
import com.future.domain.Competition;
import com.future.utils.PageBean;
import com.future.utils.Page_S;

public interface CompetitionService {

	//传入model，在service层实现修改
	void alterCompetition(Competition model);
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
	
	/**
	 * 分页查询出可报名的比赛
	 * @param ps
	 * @return
	 */
	public Page_S findapplyCompetition(Page_S ps);
	
	
	public Competition findCompetitionById(Integer id);
	
	public void updateCompetition(Competition comp);
	/**
	 * 得到本年申请的并且已经结束的竞赛
	 * @return
	 */
	public List<Competition> getAvaliableCopetion();
	/**
	 * 得到 进入下级比赛的竞赛项目
	 */
	public List<Competition> getNextClassCompetition(Integer depId);
	/**
	 * 更改之指定项目的状态，使其可以再次进行成绩的录入，学生进行报名
	 */
	public void changeCompetitionStatus(Integer compeId, Integer compeStatus);
}
