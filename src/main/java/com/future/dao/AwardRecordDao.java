package com.future.dao;

import java.util.List;

import com.future.domain.AwardRecord;
import com.future.domain.ProjectAwardNum;
import com.future.domain.Student;
import com.future.utils.DeQuery;
import com.future.utils.PageBean;
import com.future.utils.Page_S;

public interface AwardRecordDao {
	//查询待审核竞赛结果
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
	void noPass(Integer id, String reason);

	//查询所有获奖记录
	List<AwardRecord> findAllAwardRecord();

	//条件查询
	List<AwardRecord> conditionQuery(AwardRecord model);

	//分页查询所有获奖记录
	PageBean getPageBeanFindAllAwardRecord(int pageNum, int pageSize);

	//分页条件查询
	PageBean getPageBeanConditionQuery(int pageNum, int pageSize, AwardRecord model);

	public Page_S findAwardByStudent(Student s,Page_S ps);
	
	
	public AwardRecord findAwardRecordById(Integer id);

	public void saveOrUpdaAward(AwardRecord ar);
	/**
	 * 保存获奖记录
	 */
	public void saveAwardRecord(AwardRecord awardRecord);

	//分页查询当前院系所有获奖记录
	PageBean getPageBeanDefindAllAwardRecord(int pageNum, int pageSize, Integer department);

	//分页院系条件查询
	PageBean getPageBeanDeConditionQuery(int pageNum, int pageSize, DeQuery model, Integer department);

	//默认提交最高的奖金
	public void beCalled();

	//分页查询当前院系申报项目的所有获奖记录  
	PageBean getPageBeanFindAllDeCoAwardRecord(int pageNum, int pageSize, Integer department);

	//学院负责人查看本院申请项目获奖情况
	PageBean getPageBeanfindAllDeCoAcCond(int pageNum, int pageSize, DeQuery model, Integer department);
	
	//拿到所有记录当前登陆学院负责人session 的院系 的所有竞赛项目 的获奖记录
	List<AwardRecord> getAllAlert(Integer depId);

	//拿到所有记录当前登陆学院负责人session 的院系 的所有竞赛项目 的获奖记录
	PageBean getPageBeanAllAlert(int pageNum, int pageSize, Integer depId);

	//根据id得到某条获奖记录
	AwardRecord getById(Integer id);

	//调用方法，保存  liuyang
	void saveAwardRecordLY(AwardRecord model);
	//学院负责人查看本院申请项目获奖情况nm, int pageSize, DeQuery model, Integer department);
	
	//统计全校指定项目的获奖情况汇总
	public List<ProjectAwardNum> getProjectAwardNum();
	
	
	
	
}
