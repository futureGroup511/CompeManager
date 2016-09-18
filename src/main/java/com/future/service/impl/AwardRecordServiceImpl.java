package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AwardRecordDao;
import com.future.domain.AwardRecord;

import com.future.service.AwardRecordService;
import com.future.utils.DeQuery;
import com.future.utils.PageBean;
import com.future.domain.Student;
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
	
	@Override
	public AwardRecord findAwardRecordById(Integer id) {
		return awardRecordDao.findAwardRecordById(id);
	}

	@Override
	public void saveOrUpdaAward(AwardRecord ar) {
		awardRecordDao.saveOrUpdaAward(ar);
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
		return awardRecordDao.getPageBeanNoPassCheckAwardRecord(pageNum,pageSize);
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

	//分页查询当前院系所有获奖记录
	@Override
	public PageBean getPageBeanDefindAllAwardRecord(int pageNum, int pageSize, Integer department) {
		return awardRecordDao.getPageBeanDefindAllAwardRecord(pageNum,pageSize,department);
	}

	//分页院系条件查询
	@Override
	public PageBean getPageBeanDeConditionQuery(int pageNum, int pageSize, DeQuery model, Integer department) {
		return awardRecordDao.getPageBeanDeConditionQuery(pageNum, pageSize,model,department);
	}
	
	
	//默认提交最高的奖金
	public void beCalled(){
		awardRecordDao.beCalled();
	}

	//分页查询当前院系申报项目的所有获奖记录  
	@Override
	public PageBean getPageBeanFindAllDeCoAwardRecord(int pageNum, int pageSize, Integer department) {
		return awardRecordDao.getPageBeanFindAllDeCoAwardRecord(pageNum, pageSize,department);
	}

	//学院负责人查看本院申请项目获奖情况
	@Override
	public PageBean getPageBeanfindAllDeCoAcCond(int pageNum, int pageSize, DeQuery model, Integer department) {
		return awardRecordDao.getPageBeanfindAllDeCoAcCond(pageNum, pageSize,model,department);
	}

	//拿到所有记录当前登陆学院负责人session 的院系 的所有竞赛项目 的获奖记录
	@Override
	public List<AwardRecord> getAllAlert(Integer depId) {
		return awardRecordDao.getAllAlert(depId);
	}

	//拿到所有记录当前登陆学院负责人session 的院系 的所有竞赛项目 的获奖记录
	@Override
	public PageBean getPageBeanAllAlert(int pageNum, int pageSize, Integer depId) {
		return awardRecordDao.getPageBeanAllAlert(pageNum, pageSize,depId);
	}

	//根据id得到某条获奖记录
	@Override
	public AwardRecord getById(Integer id) {
		return awardRecordDao.getById(id);
	}

	//调用方法，保存  liuyang
	@Override
	public void saveAwardRecordLY(AwardRecord model) {
		awardRecordDao.saveAwardRecordLY(model);
	}
	
	
}
