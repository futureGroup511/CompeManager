package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionHierarchyDao;
import com.future.domain.CompetitionHierarchy;
import com.future.service.CompetitionHierarchyService;
import com.future.utils.Page_S;

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

	@Override
	public Page_S findAllCompeHierarchy(Page_S ps) {
		return competitionHierarchyDao.findAllCompeHierarchy(ps);
	}

	@Override
	public CompetitionHierarchy fomdByID(Integer id) {
		return competitionHierarchyDao.fomdByID(id);
	}

	@Override
	public void addOrupdate(CompetitionHierarchy competitionHierarchy) {
		competitionHierarchyDao.addOrupdate(competitionHierarchy);
	}
	
}
