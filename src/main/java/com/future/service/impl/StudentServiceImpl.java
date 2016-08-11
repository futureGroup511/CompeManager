package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.StudentDao;

@Service
@Transactional
public class StudentServiceImpl {

	@Resource
	private StudentDao studentDao;
}
