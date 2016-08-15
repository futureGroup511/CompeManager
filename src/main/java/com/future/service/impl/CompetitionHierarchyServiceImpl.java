package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionHierarchyDao;
import com.future.domain.CompetitionHierarchy;
import com.future.service.CompetitionHierarchyService;

@Service
@Transactional
public class CompetitionHierarchyServiceImpl implements CompetitionHierarchyService{

	@Resource
	private CompetitionHierarchyDao competitionHierarchyDao;
	
	/**
	 * zhaoshuo
	 * 得到所有竞赛等级
	 */
	public List<CompetitionHierarchy> getAll(){
		return competitionHierarchyDao.getAll();
	}
	
}
