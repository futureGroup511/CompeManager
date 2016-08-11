package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.DepManagerDao;

@Service
@Transactional
public class DepManagerServiceImpl {

	@Resource
	private DepManagerDao depManagerDao;
}
