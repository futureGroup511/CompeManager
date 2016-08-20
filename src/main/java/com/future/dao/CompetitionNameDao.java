package com.future.dao;

import java.util.List;

import com.future.domain.CompetitionName;
import com.future.utils.PageBean;

public interface CompetitionNameDao {

	////查询待审核竞赛名称立标
	List<CompetitionName> findAllCheckNoName();

	//1、调用service查询审核成功项目名称
	List<CompetitionName> checkSuccessName();

	//查看未通过审核竞赛名称
	List<CompetitionName> noPassCheck();

	//通过
	void pass(Integer id);

	//未通过
	void noPass(Integer id);

	//通过id获得具体数据
	CompetitionName findById(Integer id);

	//保存
	void save(CompetitionName competitionName);

	//分页查看审核成功竞赛名称
	PageBean getPageBeanCheckSuccessName(int pageNum, int pageSize);

	//分页查看待审核竞赛名称
	PageBean getPageBeanCheckNoName(int pageNum, int pageSize);

	//分页查看未通过审核竞赛名称
	PageBean getPageBeanNoPassCheck(int pageNum, int pageSize);

}
