package com.future.service;

import java.util.List;

import com.future.domain.Department;
import com.future.utils.Page_S;

public interface DepartmentService {

	
	public Department findDepartById(Integer id);
	
	public Page_S findAllDepartment(Page_S ps);
	
	public void addOrupdate(Department dt);
	
	/**
	 * 查询所有学院
	 * @return
	 */
	public List<Department> getAllDepartMent();
}
