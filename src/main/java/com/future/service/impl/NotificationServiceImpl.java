package com.future.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.NotificationDao;

@Service
@Transactional
public class NotificationServiceImpl {

	@Resource
	private NotificationDao notificationDao;
}
