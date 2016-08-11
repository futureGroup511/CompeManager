package com.future.dao.impl;

import org.springframework.stereotype.Repository;

import com.future.base.BaseDao;
import com.future.dao.TestDao;
import com.future.domain.Admin;
@Repository
public class TestDaoImpl extends BaseDao implements TestDao{
	
	public void save(Admin admin) {
		getsession().save(admin);
	}

}
