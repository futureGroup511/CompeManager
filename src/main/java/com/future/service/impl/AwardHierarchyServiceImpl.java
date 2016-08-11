package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AwardHierarchyDao;

@Service
@Transactional
public class AwardHierarchyServiceImpl {

	@Resource
	private AwardHierarchyDao awardHierarchyDao;
}
