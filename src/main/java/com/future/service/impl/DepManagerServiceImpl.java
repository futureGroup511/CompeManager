package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.DepManagerDao;
import com.future.domain.DepManager;
import com.future.service.DepManagerService;

@Service
@Transactional
public class DepManagerServiceImpl implements DepManagerService{

	@Resource
	private DepManagerDao depManagerDao;

	@Override
	public DepManager getByNumAndPassword(String num, String password) {
		return depManagerDao.getByNumAndPassword(num, password);
	}
}
