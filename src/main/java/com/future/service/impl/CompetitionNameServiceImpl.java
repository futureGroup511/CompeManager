package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionNameDao;
import com.future.domain.CompetitionName;
import com.future.service.CompetitionNameService;

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
}
