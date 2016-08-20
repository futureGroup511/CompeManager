package com.future.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.DepartmentDao;
import com.future.domain.Department;
import com.future.domain.SignUp;
import com.future.utils.Page_S;

@Repository
public class DepartmentDaoImpl extends BaseDao implements DepartmentDao {

	@Override
	public Page_S findAllDepartment(Page_S ps) {
		Criteria criteria=getsession().createCriteria(Department.class);
		Long totalNum=(Long)criteria.setProjection(Projections.rowCount()).uniqueResult();
		criteria.setProjection(null);
		criteria.setFirstResult((ps.getCurrentPage()-1)*ps.getPageSize());
		criteria.setMaxResults(ps.getPageSize());
		List<Department> departments=criteria.list();
		Integer num=Integer.valueOf(totalNum.toString());
		Page_S p=new Page_S(ps.getCurrentPage(), ps.getPageSize(),num , departments);
		return p;
	}

	@Override
	public Department findDepartById(Integer id) {
		Department department=new Department();
		getsession().load(department, id);
		return department;
	}

	@Override
	public void addOrupdate(Department dt) {
			getsession().saveOrUpdate(dt);
	}

	@Override
	public List<Department> getAllDepartMent() {
		String hql="From Department d ";
		List<Department> departments=getsession().createQuery(hql).list();
		return departments;
	}

	
	
}
