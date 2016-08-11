package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AwardStandardDao;

@Service
@Transactional
public class AwardStandardServiceImpl {

	@Resource
	private AwardStandardDao awardStandardDao;
}
