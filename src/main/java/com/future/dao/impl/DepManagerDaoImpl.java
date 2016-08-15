package com.future.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.DepManagerDao;
import com.future.domain.DepManager;

@Repository
public class DepManagerDaoImpl extends BaseDao implements DepManagerDao {

	@Override
	public DepManager getByNumAndPassword(String num, String password) {
		
		String sql = "from DepManager depM where depM.depM_num = :depM_num and depM.depM_password = :depM_password";
		Query query = getsession().createQuery(sql)
								.setParameter("depM_num", num)
								.setParameter("depM_password", password);
		DepManager depManager = (DepManager)query.uniqueResult();
		if(depManager != null){
			return depManager;
		}
		return null;
	}

}
