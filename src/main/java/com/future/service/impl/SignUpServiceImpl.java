package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.SignUpDao;

@Service
@Transactional
public class SignUpServiceImpl {

	@Resource
	private SignUpDao signUpDao;
}
