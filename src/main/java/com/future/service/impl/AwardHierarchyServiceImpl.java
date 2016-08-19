package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AwardHierarchyDao;
import com.future.domain.AwardHierarchy;
import com.future.service.AwardHierarchyService;

@Service
@Transactional
public class AwardHierarchyServiceImpl implements AwardHierarchyService{

	@Resource
	private AwardHierarchyDao awardHierarchyDao;

	@Override
	public List<AwardHierarchy> getGroupOrPersonalAwardHie(boolean isGroup) {
		return awardHierarchyDao.getGroupOrPersonalAwardHie(isGroup);
	}

	@Override
	public AwardHierarchy getSpecialAwardHie(Integer awardHieId) {
		return awardHierarchyDao.getSpecialAwardHie(awardHieId);
	}
}
