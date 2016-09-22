package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AwardHierarchyDao;
import com.future.domain.AwardHierarchy;
import com.future.service.AwardHierarchyService;
import com.future.utils.Page_S;

@Service
@Transactional
public class AwardHierarchyServiceImpl implements AwardHierarchyService{


	//查询所有奖项
	@Override
	public List<AwardHierarchy> findAllAwardHierarchy() {
		return awardHierarchyDao.findAllAwardHierarchy();
	}
	
	@Resource
	private AwardHierarchyDao awardHierarchyDao;

	@Override
	public Page_S findAll(Page_S ps) {
		return awardHierarchyDao.findAll(ps);
	}

	@Override
	public AwardHierarchy fomdByID(Integer id) {
		return awardHierarchyDao.fomdByID(id);
	}

	@Override
	public void addOrupdate(AwardHierarchy awardHierarchy) {
		awardHierarchyDao.addOrupdate(awardHierarchy);
	}
	public List<AwardHierarchy> getGroupOrPersonalAwardHie(boolean isGroup) {
		return awardHierarchyDao.getGroupOrPersonalAwardHie(isGroup);
	}

	@Override
	public AwardHierarchy getSpecialAwardHie(Integer awardHieId) {
		return awardHierarchyDao.getSpecialAwardHie(awardHieId);
	}

	//查询所有奖项
	@Override
	public List<AwardHierarchy> findAllAwardHierarchyTG() {
		return awardHierarchyDao.findAllAwardHierarchyTG();
	}
}
