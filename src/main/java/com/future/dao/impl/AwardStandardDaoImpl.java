package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.AwardStandardDao;
import com.future.domain.AwardHierarchy;
import com.future.domain.AwardStandard;
import com.future.domain.CompetitionHierarchy;
import com.future.utils.Page_S;

@Repository
public class AwardStandardDaoImpl extends BaseDao implements AwardStandardDao {

	@Override
	public Page_S findAll(Page_S ps) {
		Criteria criteria=getsession().createCriteria(AwardStandard.class);
		Long totalNum=(Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		criteria.setProjection(null);
		criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		criteria.setMaxResults(ps.getPageSize());
		List<CompetitionHierarchy> chs=criteria.list();
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(), Integer.valueOf(totalNum.toString()),chs);
		return p;
	}

	@Override
	public AwardStandard fomdByID(Integer id) {
		AwardStandard as=new AwardStandard();
		getsession().load(as, id);
		return as;
	}

	@Override
	public void addOrupdate(AwardStandard as) {
		getsession().saveOrUpdate(as);
	}

	@Override
	public List<AwardStandard> getAll() {
		String hql="From AwardStandard";
		List<AwardStandard> awardStandards=getsession().createQuery(hql).list();
		return awardStandards;
	}

	//根据获奖等级id，找到奖励标准
	@Override
	public AwardStandard findById(Integer id) {
		//首先根据id得到获奖等级
		String hql1 = "from AwardHierarchy where awardHie_id = ?";
		AwardHierarchy awardHierarchy = (AwardHierarchy) getsession().createQuery(hql1).setParameter(0, id).uniqueResult();
		
		//System.out.println(awardHierarchy.getAwardHie_standard().getAward_stuMoney());
		//拿到获奖等级的，奖励标准的id
		//根据id得到奖励标准
		
		return awardHierarchy.getAwardHie_standard();
	}

}
