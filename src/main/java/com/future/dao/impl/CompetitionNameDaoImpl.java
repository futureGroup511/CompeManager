package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CompetitionNameDao;
import com.future.domain.CompetitionName;

@Repository
public class CompetitionNameDaoImpl extends BaseDao implements CompetitionNameDao{

	@Override
	public void save(CompetitionName competitionName) {
		getsession().save(competitionName);
	}

	@Override
	public List<CompetitionName> getAllCompeNames() {
		String sql = "from CompetitionName";
		List<CompetitionName> competitionNames = getsession().createQuery(sql).list();
		return competitionNames;
	}

}
