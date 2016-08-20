package com.future.dao.impl;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.CompetitionDao;
import com.future.domain.Competition;
import com.future.utils.Page_S;

@Repository
public class CompetitionDaoImpl extends BaseDao implements CompetitionDao {

	@Override
	public Page_S findapplyCompetition(Page_S ps) {
		
		
		return null;
	}

	//根据id获取对象
	@Override
	public Competition findById(Integer compe_id) {
		String hql="from Competition c where c.compe_id=?";
		return (Competition) getsession().createQuery(hql).setParameter(0, compe_id).uniqueResult();
	}

	//保存修改
	@Override
	public void save(Competition competition) {
		getsession().save(competition);
	}

}
