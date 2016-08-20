package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.DepManagerDao;
import com.future.domain.DepManager;
import com.future.domain.SignUp;
import com.future.utils.Page_S;

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

	@Override
	public Page_S getAllDepManageByPage(Page_S ps) {
		Criteria criteria=getsession().createCriteria(DepManager.class);
		Long tatalnum=(Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		criteria.setProjection(null);
		criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		criteria.setMaxResults(ps.getPageSize());
		List<DepManager> dms=criteria.list();
		Integer num=Integer.valueOf(tatalnum.toString());
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(),num , dms);
		return p;
	}

	@Override
	public void deleteDep(Integer id) {
		String hql="delete DepManager dm where dm.depM_id=?";
		 getsession().createQuery(hql).setInteger(0, id).executeUpdate();
	}

	@Override
	public DepManager getDemById(Integer id) {
		DepManager dm=new DepManager();
		getsession().load(dm, id);
		return dm;
	}

	@Override
	public void addOrUpdate(DepManager dm) {
		getsession().saveOrUpdate(dm);
	}

	@Override
	public List<DepManager> getAllDepManager() {
		String hql="From DepManager dm ";
		List<DepManager> depManagers=getsession().createQuery(hql).list();
		return depManagers;
	}

}
