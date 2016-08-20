package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.AwardHierarchyDao;
import com.future.domain.AwardHierarchy;

@Repository
public class AwardHierarchyDaoImpl  extends BaseDao implements AwardHierarchyDao{
	
	//查询所有奖项  ly
	@Override
	public List<AwardHierarchy> findAllAwardHierarchy() {
		//String hql = "from AwardHierarchy";
		String hql = "from AwardHierarchy a group by a.awardHie_name";
		return getsession().createQuery(hql).list();
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


