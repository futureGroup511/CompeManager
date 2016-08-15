package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CompetitionDao;
import com.future.domain.Competition;
import com.future.utils.PageBean;

@Repository
public class CompetitionDaoImpl extends BaseDao implements CompetitionDao {

	@Override
	public void save(Competition competition) {
		
		getsession().save(competition);
	}

	@Override
	public List<Competition> getCompetitions() {
		String sql = "from Competition";
		return getsession().createQuery(sql).list();
	}

	@Override
	public List<Competition> getCompetitionByPage(PageBean pageBean) {
		String sql = "from Competition order by compe_requestDate desc";
		List<Competition> recoreds = getsession()
				.createQuery(sql)//
				.setFirstResult((pageBean.getCurrentPage()-1)*pageBean.getPageSize())//
				.setMaxResults(pageBean.getPageSize())//
				.list();
		return recoreds;
	}

	@Override
	public Competition getCompetitionById(Integer id) {
		String sql = "from Competition compe where compe.compe_id = :compe_id";
		Competition compe = (Competition)getsession().createQuery(sql).setParameter("compe_id", id)
													.uniqueResult();
		return compe;
	}

	@Override
	public Integer getCompetitionCount() {
		String sql = "select count(*) from Competition";
		Integer count = ((Long)getsession().createQuery(sql).iterate().next()).intValue();
		return count;
	}

}
