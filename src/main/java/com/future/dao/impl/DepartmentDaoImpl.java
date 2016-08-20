package com.future.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.DepartmentDao;
import com.future.domain.Department;

@Repository
public class DepartmentDaoImpl extends BaseDao implements DepartmentDao {

	//查询所有学院
	@Override
	public List<Department> findAllDepartment() {
		String hql = "from Department";
		return getsession().createQuery(hql).list();
	}

}
