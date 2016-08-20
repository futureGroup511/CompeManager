package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionDao;
import com.future.domain.Competition;
import com.future.service.CompetitionService;

@Service
@Transactional
public class CompetitionServiceImpl implements CompetitionService {

	@Resource
	private CompetitionDao competitionDao;

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
	
	
}
