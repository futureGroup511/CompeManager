package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.DepartmentDao;
import com.future.domain.Department;
import com.future.service.DepartmentService;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentService {

	@Resource
	private DepartmentDao departmentDao;

	//查询所有学院
	@Override
	public List<Department> findAllDepartment() {
		return departmentDao.findAllDepartment();
	}
}
