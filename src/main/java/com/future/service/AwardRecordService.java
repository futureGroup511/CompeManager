package com.future.service;

import java.util.List;

import com.future.domain.AwardRecord;
import com.future.utils.PageBean;

public interface AwardRecordService {

	//1、调用service查询待审核竞赛结果
	List<AwardRecord> findCheckNoAwardRecord();

	//查看审核通过竞赛结果
	List<AwardRecord> findCheckSuccessAwardRecord();

	//查看未通过审核竞赛结果
	List<AwardRecord> findNoPassCheckAwardRecord();
	
	//分页查看待审核竞赛结果
	PageBean getPageBeanCheckNoAwardRecord(int pageNum, int pageSize);

	//分页查看审核通过竞赛结果
	PageBean getPageBeanCheckSuccessAwardRecord(int pageNum, int pageSize);

	//分页查看未通过审核竞赛结果
	PageBean getPageBeanNoPassCheckAwardRecord(int pageNum, int pageSize);

	//通过
	void pass(Integer id);

	//未通过
	void noPass(Integer id);

	////查询所有获奖记录
	List<AwardRecord> findAllAwardRecord();

	//条件查询
	List<AwardRecord> conditionQuery(AwardRecord model);

	//分页查询所有获奖记录
	PageBean getPageBeanFindAllAwardRecord(int pageNum, int pageSize);

	//分页条件查询
	PageBean getPageBeanConditionQuery(int pageNum, int pageSize, AwardRecord model);

	

}
