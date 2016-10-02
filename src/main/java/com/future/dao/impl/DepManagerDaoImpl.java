package com.future.dao.impl;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
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
		//String md5Digest = DigestUtils.md5Hex(dm.getDepM_password());
		//dm.setDepM_password(md5Digest);
		DepManager dep = findById(dm.getDepM_id());
		dep.setDepM_name(dm.getDepM_name());
		dep.setDepM_phoneNum(dm.getDepM_phoneNum());
		getsession().saveOrUpdate(dep);
	}

	
	private DepManager findById(Integer depM_id) {
		String hql = "from DepManager d where d.depM_id = ?";
		return (DepManager) getsession().createQuery(hql).setParameter(0, depM_id).uniqueResult();
	}

	@Override
	public List<DepManager> getAllDepManager() {
		String hql="From DepManager dm ";
		List<DepManager> depManagers=getsession().createQuery(hql).list();
		return depManagers;
	}

	//重置密码
	@Override
	public void resetPassWord(Integer id) {
		DepManager dep = findById(id);
		String md5Digest = DigestUtils.md5Hex(dep.getDepM_num());
		dep.setDepM_password(md5Digest);
	}

	//添加学院负责人
	@Override
	public void addDepartmentManager(DepManager dm) {
		String md5Digest = DigestUtils.md5Hex(dm.getDepM_password());
		dm.setDepM_password(md5Digest);
		getsession().save(dm);
	}

}
