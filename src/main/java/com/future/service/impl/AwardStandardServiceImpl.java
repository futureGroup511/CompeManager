package com.future.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AwardStandardDao;
import com.future.domain.AwardStandard;
import com.future.service.AwardStandardService;
import com.future.utils.Page_S;

@Service
@Transactional
public class AwardStandardServiceImpl implements AwardStandardService{
	
	@Resource
	private AwardStandardDao awardStandardDao;

	@Override
	public Page_S findAll(Page_S ps) {
		return awardStandardDao.findAll(ps);
	}

	@Override
	public AwardStandard fomdByID(Integer id) {
		return awardStandardDao.fomdByID(id);
	}

	@Override
	public void addOrupdate(AwardStandard as) {
		awardStandardDao.addOrupdate(as);
	}

	@Override
	public List<AwardStandard> getAll() {
		return awardStandardDao.getAll();
	}

	//根据获奖等级id，找到奖励标准
	@Override
	public AwardStandard findById(Integer id) {
		return awardStandardDao.findById(id);
	}
}
