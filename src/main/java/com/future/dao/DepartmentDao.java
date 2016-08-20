package com.future.dao;

import java.util.List;

import com.future.domain.Department;

public interface DepartmentDao {

	//查询所有学院
	List<Department> findAllDepartment();

}
