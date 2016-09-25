package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionNameDao;
import com.future.domain.CompetitionName;
import com.future.service.CompetitionNameService;
import com.future.utils.PageBean;



@Service
@Transactional
public class CompetitionNameServiceImpl implements CompetitionNameService{
	@Resource
	private CompetitionNameDao competitionNameDao;

	
	@Override
	public void save(CompetitionName competitionName) {
		competitionNameDao.save(competitionName);
	}

	@Override
	public List<CompetitionName> getAllCompeNames() {
		return competitionNameDao.getAllCompeNames();
	}

	@Override
	public List<CompetitionName> getAvailableCompeNames() {
		return competitionNameDao.getAvailableCompeNames();
	}
	//================================
	//查询待审核竞赛名称
	@Override
	public List<CompetitionName> findAllCheckNoName() {
		return competitionNameDao.findAllCheckNoName();
	}

	//1、调用service查询审核成功项目名称
	@Override
	public List<CompetitionName> checkSuccessName() {
		return competitionNameDao.checkSuccessName();
	}

	//查看未通过审核竞赛名称
	@Override
	public List<CompetitionName> noPassCheck() {
		return competitionNameDao.noPassCheck();
	}

	//通过
	@Override
	public void pass(Integer id) {
		competitionNameDao.pass(id);
	}

	//未通过
	@Override
	public void noPass(Integer id,String reason) {
		competitionNameDao.noPass(id,reason);
	}

	//通过id获得具体数据
	@Override
	public CompetitionName findById(Integer id) {
		return competitionNameDao.findById(id);
	}

	//修改
	@Override
	public void alter(CompetitionName model) {
		//首先根据id拿到对象
		CompetitionName competitionName = findById(model.getCompeName_id());
		competitionName.setCompeName_name(model.getCompeName_name());
		competitionName.setCompeName_descr(model.getCompeName_descr());
		//保存
		competitionNameDao.save(competitionName);
	}

	//分页查看审核成功竞赛名称
	@Override
	public PageBean getPageBeanCheckSuccessName(int pageNum, int pageSize) {
		return competitionNameDao.getPageBeanCheckSuccessName(pageNum,pageSize);
	}

	//分页查看待审核竞赛名称
	@Override
	public PageBean getPageBeanCheckNoName(int pageNum, int pageSize) {
		return competitionNameDao.getPageBeanCheckNoName(pageNum,pageSize);
	}

	//分页查看未通过审核竞赛名称
	@Override
	public PageBean getPageBeanNoPassCheck(int pageNum, int pageSize) {
		return competitionNameDao.getPageBeanNoPassCheck(pageNum,pageSize);
	}

	@Override
	public List<CompetitionName> getCompeNamesByPageBean(PageBean pageBean) {
		return competitionNameDao.getCompeNamesByPageBean(pageBean);
	}

	@Override
	public boolean queryCompeName(String compeNameVal) {
		return competitionNameDao.queryCompeName(compeNameVal);
	}
}
