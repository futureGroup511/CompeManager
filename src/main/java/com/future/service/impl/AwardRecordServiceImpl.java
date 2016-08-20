package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AwardRecordDao;
import com.future.domain.AwardRecord;

import com.future.service.AwardRecordService;
import com.future.utils.PageBean;
import com.future.domain.Student;
import com.future.service.AwardRecordService;
import com.future.utils.Page_S;

@Service
@Transactional

public class AwardRecordServiceImpl implements AwardRecordService{

	@Resource
	private AwardRecordDao awardRecordDao;
	
	@Override
	public Page_S findAwardByStudent(Student s, Page_S ps) {
		return awardRecordDao.findAwardByStudent(s, ps);
	}
	
	@Override
	public void saveAwardRecord(AwardRecord awardRecord) {
		awardRecordDao.saveAwardRecord(awardRecord);
	}
	
	//====================================================
	//调用service查询待审核竞赛结果
	@Override
	public List<AwardRecord> findCheckNoAwardRecord() {
		return awardRecordDao.findCheckNoAwardRecord();
	}

	//查看审核通过竞赛结果
	@Override
	public List<AwardRecord> findCheckSuccessAwardRecord() {
		return awardRecordDao.findCheckSuccessAwardRecord();
	}

	//查看未通过审核竞赛结果
	@Override
	public List<AwardRecord> findNoPassCheckAwardRecord() {
		return awardRecordDao.findNoPassCheckAwardRecord();
	}
	
	//分页查看待审核竞赛结果
	@Override
	public PageBean getPageBeanCheckNoAwardRecord(int pageNum, int pageSize) {
		return awardRecordDao.getPageBeanCheckNoAwardRecord(pageNum,pageSize);
	}

	//分页查看审核通过竞赛结果
	@Override
	public PageBean getPageBeanCheckSuccessAwardRecord(int pageNum, int pageSize) {
		return awardRecordDao.getPageBeanCheckSuccessAwardRecord(pageNum,pageSize);
	}

	//分页查看未通过审核竞赛结果
	@Override
	public PageBean getPageBeanNoPassCheckAwardRecord(int pageNum, int pageSize) {
		return awardRecordDao.getPageBeanCheckSuccessAwardRecord(pageNum,pageSize);
	}


	//通过
	@Override
	public void pass(Integer id) {
		awardRecordDao.pass(id);
	}

	//未通过
	@Override
	public void noPass(Integer id) {
		awardRecordDao.noPass(id);
	}

	//查询所有获奖记录
	@Override
	public List<AwardRecord> findAllAwardRecord() {
		return awardRecordDao.findAllAwardRecord();
	}

	//条件查询
	@Override
	public List<AwardRecord> conditionQuery(AwardRecord model) {
		return awardRecordDao.conditionQuery(model);
	}

	//分页查询所有获奖记录
	@Override
	public PageBean getPageBeanFindAllAwardRecord(int pageNum, int pageSize) {
		return awardRecordDao.getPageBeanFindAllAwardRecord(pageNum,pageSize);
	}

	//分页条件查询
	@Override
	public PageBean getPageBeanConditionQuery(int pageNum, int pageSize, AwardRecord model) {
		return awardRecordDao.getPageBeanConditionQuery(pageNum,pageSize,model);
	}
	//====================================================

	
	
}
