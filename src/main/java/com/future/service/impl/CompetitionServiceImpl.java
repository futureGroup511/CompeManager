package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionDao;
import com.future.domain.Competition;
import com.future.domain.CompetitionName;
import com.future.service.CompetitionNameService;
import com.future.service.CompetitionService;
import com.future.utils.PageBean;

@Service
@Transactional
public class CompetitionServiceImpl implements CompetitionService{

	@Resource
	private CompetitionDao competitionDao;

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

}
