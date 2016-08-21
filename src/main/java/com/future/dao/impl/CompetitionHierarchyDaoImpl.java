package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CompetitionHierarchyDao;
import com.future.domain.CompetitionHierarchy;
import com.future.utils.Page_S;

@Repository
public class CompetitionHierarchyDaoImpl extends BaseDao implements CompetitionHierarchyDao {

	@Override
	public List<CompetitionHierarchy> getAll() {
		String sql = "from CompetitionHierarchy";
		List<CompetitionHierarchy> competitionHierarchies = getsession().createQuery(sql).list();
		return competitionHierarchies;
	}

	@Override
	public Page_S findAllCompeHierarchy(Page_S ps) {
		Criteria criteria=getsession().createCriteria(CompetitionHierarchy.class);
		Long totalNum=(Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		criteria.setProjection(null);
		criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		criteria.setMaxResults(ps.getPageSize());
		List<CompetitionHierarchy> chs=criteria.list();
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(), Integer.valueOf(totalNum.toString()),chs);
		return p;
	}

	@Override
	public CompetitionHierarchy fomdByID(Integer id) {
		CompetitionHierarchy ch=new CompetitionHierarchy();
		getsession().load(ch, id);
		return ch;
	}

	@Override
	public void addOrupdate(CompetitionHierarchy competitionHierarchy) {
		getsession().saveOrUpdate(competitionHierarchy);
	}

}
