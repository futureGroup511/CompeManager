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
		query.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		query.setMaxResults(ps.getPageSize());
		List<Competition> competitions=query.list();
		int count=getAllCount();
		
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(), count, competitions);
		return p;
	}

	@Override
	public Integer getAllCount() {
		String hql="select count(*) from Competition c";
		Query query=getsession().createQuery(hql);
		Integer count=((Number)query.iterate().next()).intValue();
		return count;
	}

	@Override
	public Competition findCompetitionById(Integer id) {
		String hql="From Competition c where c.compe_id=?";
		Competition comp=(Competition) getsession().createQuery(hql).setInteger(0, id).uniqueResult();
		return comp;
	}

	@Override
	public void updateCompetition(Competition comp) {
		getsession().update(comp);
	}

}
