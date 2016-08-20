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

	//查询所有奖项
	@Override
	public List<AwardHierarchy> findAllAwardHierarchy() {
		return awardHierarchyDao.findAllAwardHierarchy();
	}
}
