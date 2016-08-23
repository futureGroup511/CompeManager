package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionDao;
import com.future.domain.Competition;
import com.future.service.CompetitionService;
import com.future.utils.PageBean;
import com.future.utils.Page_S;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.future.service.CompetitionService;

@Service
@Transactional
public class CompetitionServiceImpl  implements CompetitionService{

	@Resource
	private CompetitionDao competitionDao;

	@Override
	public Page_S findapplyCompetition(Page_S ps) {
		return competitionDao.findapplyCompetition(ps);
	}

	@Override
	public Competition findCompetitionById(Integer id) {
		return competitionDao.findCompetitionById(id);
	}

	@Override
	public void updateCompetition(Competition comp) {
		competitionDao.updateCompetition(comp);
	}
	
	@Override
	public void save(Competition competition) {
		competitionDao.save(competition);
	}

	@Override
	public List<Competition> getCompetitions() {
		return competitionDao.getCompetitions();
	}

	@Override
	public List<Competition> getCompetitionByPage(PageBean pageBean) {
		return competitionDao.getCompetitionByPage(pageBean);
	}

	@Override
	public Competition getCompetitionById(Integer id) {
		return competitionDao.getCompetitionById(id);
	}

	@Override
	public Integer getCompetitionCount() {
		return competitionDao.getCompetitionCount();
	}

	@Override
	public List<Competition> getAvaliableCopetion() {
		return competitionDao.getAvaliableCopetion();
	}
	//======================================================
	//接收到一个mode，实现竞赛修改竞赛项目
	@Override
	public void alterCompetition(Competition model) {
		//首先根据id从数据库中获得原对象，在重新赋值
		Competition competition = competitionDao.findById(model.getCompe_id());
		
		//保存
		competition.setCompe_manager(model.getCompe_manager());
		competition.setCompe_money(model.getCompe_money());
		competition.setCompe_requestDate(model.getCompe_requestDate());
		competition.setCompe_startTime(model.getCompe_startTime());
		competition.setCompe_endTime(model.getCompe_endTime());
		competition.setCompe_digest(model.getCompe_digest());
		competition.setCompe_program(model.getCompe_program());
		
		competitionDao.save(competition);
	}
	//======================================================

	@Override
	public List<Competition> getNextClassCompetition() {
		return competitionDao.getNextClassCompetition();
	}

	@Override
	public void changeCompetitionStatus(Integer compeId, Integer compeStatus) {
		competitionDao.changeCompetitionStatus(compeId, compeStatus);
	}


}
