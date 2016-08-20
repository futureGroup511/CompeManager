package com.future.dao;

import java.util.List;

import com.future.domain.Department;
import com.future.utils.Page_S;

public interface DepartmentDao {

	
	public Page_S findAllDepartment(Page_S ps);
	
	public Department findDepartById(Integer id);
	
	public void addOrupdate(Department dt);
	
	public List<Department> getAllDepartMent();

}
