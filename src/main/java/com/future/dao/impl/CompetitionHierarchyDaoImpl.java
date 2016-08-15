package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CompetitionHierarchyDao;
import com.future.domain.CompetitionHierarchy;

@Repository
public class CompetitionHierarchyDaoImpl extends BaseDao implements CompetitionHierarchyDao {

	@Override
	public List<CompetitionHierarchy> getAll() {
		String sql = "from CompetitionHierarchy";
		List<CompetitionHierarchy> competitionHierarchies = getsession().createQuery(sql).list();
		return competitionHierarchies;
	}

}
