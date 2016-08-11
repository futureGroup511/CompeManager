package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.CompetitionNameDao;

@Service
@Transactional
public class CompetitionNameServiceImpl {

	@Resource
	private CompetitionNameDao competitionNameDao;
}
