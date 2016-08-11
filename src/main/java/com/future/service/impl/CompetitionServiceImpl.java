package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionDao;

@Service
@Transactional
public class CompetitionServiceImpl {

	@Resource
	private CompetitionDao competitionDao;
}
