package com.future.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CompetitionDao;
import com.future.domain.Competition;
import com.future.utils.Page_S;

@Repository
public class CompetitionDaoImpl extends BaseDao implements CompetitionDao {

	@Override
	public Page_S findapplyCompetition(Page_S ps) {
		String  hql="From Competition c where c.compe_status=2";
		Query query=getsession().createQuery(hql);
		query.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize()+1);
		query.setMaxResults(ps.getPageSize());
		int count=getAllCount();
		List<Competition> competitions=query.list();
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(), count, competitions);
		return p;
	}

	@Override
	public Integer getAllCount() {
		String hql="select count(*) as count from Comprtition c";
		Query query=getsession().createQuery(hql);
		Integer count=((Number)query.iterate().next()).intValue();
		return count;
	}

}
