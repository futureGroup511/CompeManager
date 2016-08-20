package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.AwardHierarchyDao;
import com.future.domain.AwardHierarchy;
import com.future.domain.CompetitionHierarchy;
import com.future.utils.Page_S;

@Repository
public class AwardHierarchyDaoImpl  extends BaseDao implements AwardHierarchyDao{

	@Override
	public Page_S findAll(Page_S ps) {
		Criteria criteria=getsession().createCriteria(AwardHierarchy.class);
		Long totalNum=(Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		criteria.setProjection(null);
		criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		criteria.setMaxResults(ps.getPageSize());
		List<CompetitionHierarchy> chs=criteria.list();
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(), Integer.valueOf(totalNum.toString()),chs);
		return p;
	}

	@Override
	public AwardHierarchy fomdByID(Integer id) {
		AwardHierarchy ah=new AwardHierarchy();
		getsession().load(ah, id);
		return ah;
	}

	@Override
	public void addOrupdate(AwardHierarchy awardHierarchy) {
		getsession().saveOrUpdate(awardHierarchy);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<AwardHierarchy> getGroupOrPersonalAwardHie(boolean isGroup) {
		String sql = null;
		if(isGroup){
			 sql = "from AwardHierarchy hie where hie.awardHie_descr = '团体赛'";
		}else{
			 sql = "from AwardHierarchy hie where hie.awardHie_descr = '个人赛'";
		}
		return getsession().createQuery(sql).list();
	}

	@Override
	public AwardHierarchy getSpecialAwardHie(Integer awardHieId) {
		String sql = "from AwardHierarchy awardHie where awardHie.awardHie_id = :awardHie_id";
		return (AwardHierarchy)getsession().createQuery(sql).setParameter("awardHie_id", awardHieId)
												.uniqueResult();
	}

}
