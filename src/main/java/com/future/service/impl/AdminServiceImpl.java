package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AdminDao;

@Service
@Transactional
public class AdminServiceImpl {

	@Resource
	private AdminDao adminDao;
}
