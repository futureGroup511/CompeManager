package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionHierarchyDao;

@Service
@Transactional
public class CompetitionHierarchyServiceImpl {

	@Resource
	private CompetitionHierarchyDao competitionHierarchyDao;
}
