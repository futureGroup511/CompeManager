package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.AwardRecordDao;
import com.future.domain.Student;
import com.future.service.AwardRecordService;
import com.future.utils.Page_S;

@Service
@Transactional
public class AwardRecordServiceImpl implements AwardRecordService{

	@Resource
	private AwardRecordDao awardRecordDao;

	@Override
	public Page_S findAwardByStudent(Student s, Page_S ps) {
		return awardRecordDao.findAwardByStudent(s, ps);
	}
}
