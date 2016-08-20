package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.DepartmentDao;
import com.future.domain.Department;
import com.future.service.DepartmentService;
import com.future.utils.Page_S;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService{

	@Resource
	private DepartmentDao departmentDao;

	//查询所有学院
	@Override
	public List<Department> findAllDepartment() {
		return departmentDao.findAllDepartment();
	}
	
	@Override
	public Department findDepartById(Integer id) {
		return departmentDao.findDepartById(id);
	}

	@Override
	public Page_S findAllDepartment(Page_S ps) {
		return departmentDao.findAllDepartment(ps);
	}

	@Override
	public void addOrupdate(Department dt) {
		departmentDao.addOrupdate(dt);
	}

	@Override
	public List<Department> getAllDepartMent() {
		return departmentDao.getAllDepartMent();
	}
}
