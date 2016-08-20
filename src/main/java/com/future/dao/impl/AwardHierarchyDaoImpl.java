package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.AwardHierarchyDao;
import com.future.domain.AwardHierarchy;

@Repository
public class AwardHierarchyDaoImpl  extends BaseDao implements AwardHierarchyDao{

	//查询所有奖项
	@Override
	public List<AwardHierarchy> findAllAwardHierarchy() {
		//String hql = "from AwardHierarchy";
		String hql = "from AwardHierarchy a group by a.awardHie_name";
		return getsession().createQuery(hql).list();
	}

}
