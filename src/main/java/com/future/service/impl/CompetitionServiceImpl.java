package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionDao;
import com.future.domain.Competition;
import com.future.service.CompetitionService;
import com.future.utils.Page_S;

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
}
