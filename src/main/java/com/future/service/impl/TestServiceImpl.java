package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.TestDao;
import com.future.domain.Admin;
import com.future.service.TestService;

@Service
@Transactional
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDao testDao;
	
	public void save(Admin admin) {
		
		testDao.save(admin);
	}

}
